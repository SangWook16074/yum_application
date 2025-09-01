import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/features/ingredients/presentation/widget/ingredient_list_tile.dart';

void main() {
  const name = '양파';
  const count = 2;
  const date = '2025-09-30';

  Widget buildTestWidget(
      {required VoidCallback onEdit, required VoidCallback onDelete}) {
    return MaterialApp(
      home: Scaffold(
        body: IngredientListTile(
          name: name,
          count: count,
          date: date,
          isExpiring: true,
          onEdit: onEdit,
          onDelete: onDelete,
        ),
      ),
    );
  }

  TextStyle? textStyle(WidgetTester tester, String text) {
    return tester.widget<Text>(find.text(text)).style;
  }

  group('Ingredient Tile Row 위젯 테스트', () {
    testWidgets('텍스트가 올바르게 렌더링 되는지 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget(onEdit: () {}, onDelete: () {}));

      expect(find.text(name), findsOneWidget);
      expect(find.text('기간 임박'), findsOneWidget);
      expect(find.text('$count개'), findsOneWidget);
      expect(find.text(date), findsOneWidget);
    });

    testWidgets('텍스트 색상 및 폰트 크기 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget(onEdit: () {}, onDelete: () {}));

      expect(textStyle(tester, name)?.color, Colors.black);
      expect(textStyle(tester, name)?.fontSize, 12);

      expect(textStyle(tester, '$count개')?.color, Colors.grey);
      expect(textStyle(tester, '$count개')?.fontSize, 10);

      expect(textStyle(tester, date)?.color, Colors.grey);
      expect(textStyle(tester, date)?.fontSize, 10);

      expect(textStyle(tester, '기간 임박')?.color, Colors.white);
      expect(textStyle(tester, '기간 임박')?.fontSize, 10);
    });

    testWidgets('아이콘 버튼이 존재하고 크기가 20인지 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget(onEdit: () {}, onDelete: () {}));

      final editIcon = tester.widget<Icon>(find.byIcon(Icons.edit));
      final deleteIcon = tester.widget<Icon>(find.byIcon(Icons.delete));

      expect(editIcon.size, 20);
      expect(deleteIcon.size, 20);
      expect(find.byType(Icon), findsNWidgets(2));
    });

    testWidgets('아이콘 버튼 동작 확인', (tester) async {
      var editTapped = false;
      var deleteTapped = false;

      await tester.pumpWidget(buildTestWidget(
        onEdit: () => editTapped = true,
        onDelete: () => deleteTapped = true,
      ));

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pump();
      expect(editTapped, isTrue);

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pump();
      expect(deleteTapped, isTrue);
    });
  });

  group('Ingredient Tile Row 골든 테스트', () {
    testWidgets('골든 테스트 - 기본 UI', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IngredientListTile(
              name: name,
              count: count,
              date: date,
              isExpiring: true,
              onEdit: () {},
              onDelete: () {},
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(IngredientListTile),
        matchesGoldenFile('goldens/ingredient_list_tile.png'),
      );
    });
  });
}
