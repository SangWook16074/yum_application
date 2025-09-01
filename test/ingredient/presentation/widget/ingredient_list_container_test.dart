import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/features/ingredients/presentation/widget/ingredient_list_container.dart';
import 'package:yum_application/src/features/ingredients/presentation/widget/ingredient_list_tile.dart';

void main() {
  const title = '채소';

  final testTile1 = IngredientListTile(
    name: '양파',
    count: 2,
    date: '2025-09-30',
    isExpiring: false,
    onEdit: () {},
    onDelete: () {},
  );

  final testTile2 = IngredientListTile(
    name: '사과',
    count: 3,
    date: '2025-10-29',
    isExpiring: true,
    onEdit: () {},
    onDelete: () {},
  );

  Widget buildTestWidget(List<IngredientListTile> children) {
    return MaterialApp(
      home: Scaffold(
        body: IngredientListContainer(
          title: title,
          children: children,
        ),
      ),
    );
  }

  group('Ingredient List Container 위젯 테스트', () {
    testWidgets('카테고리 제목이 올바르게 렌더링 되는지 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget([]));

      expect(find.text(title), findsOneWidget);
    });

    testWidgets('Container에 Border와 Padding이 적용되는지 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget([]));

      final container = tester.widget<Container>(
        find.byType(Container).first,
      );

      final decoration = container.decoration as BoxDecoration;
      expect(decoration.border, isNotNull);
      expect(decoration.border?.top.color, Colors.orange);

      expect(container.padding, const EdgeInsets.symmetric(horizontal: 22));
    });
  });

  group('Ingredient List Container 위젯 테스트', () {
    testWidgets('자식이 0개일 때 렌더링 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget([]));

      expect(find.byType(IngredientListTile), findsNothing);
    });

    testWidgets('자식이 1개일 때 렌더링 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget([testTile1]));

      expect(find.text('양파'), findsOneWidget);
      expect(find.text('2개'), findsOneWidget);
      expect(find.text('2025-09-30'), findsOneWidget);
      expect(find.byType(IngredientListTile), findsOneWidget);
    });

    testWidgets('자식이 2개일 때 렌더링 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget([testTile1, testTile2]));

      expect(find.text('양파'), findsOneWidget);
      expect(find.text('사과'), findsOneWidget);
      expect(find.byType(IngredientListTile), findsNWidgets(2));
    });
  });

  group('Ingredient List Container 골든 테스트', () {
    testWidgets('골든 테스트 - 기본 UI', (tester) async {
      await tester.pumpWidget(buildTestWidget([
        IngredientListTile(
          name: '양파',
          count: 2,
          date: '2025-09-30',
          isExpiring: true,
          onEdit: () {},
          onDelete: () {},
        ),
        IngredientListTile(
          name: '사과',
          count: 3,
          date: '2025-10-29',
          isExpiring: true,
          onEdit: () {},
          onDelete: () {},
        ),
      ]));

      await expectLater(
        find.byType(IngredientListContainer),
        matchesGoldenFile('goldens/ingredient_list_container.png'),
      );
    });
  });
}
