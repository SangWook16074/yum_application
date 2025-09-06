import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/features/ingredients/presentation/widget/ingredient_orange_button.dart';

void main() {
  const title = '재료 추가';
  const IconData testIcon = Icons.abc_outlined;

  Widget buildTestWidget({VoidCallback? onTap, IconData? icon}) {
    return MaterialApp(
      // Figma 참고 데이터
      home: Scaffold(
        body: IngredientOrangeButton(
          title: title,
          width: 94,
          icon: icon,
          onTap: onTap,
        ),
      ),
    );
  }

  group('Ingredient Orange Button 위젯 테스트', () {
    testWidgets('Conatiner의 색상, Border 둥글기 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget(onTap: () {}, icon: testIcon));

      final container = tester.widget<Container>(find.descendant(
          of: find.byType(IngredientOrangeButton),
          matching: find.byType(Container)));

      final BoxDecoration decoration = container.decoration as BoxDecoration;

      expect(decoration.color, const Color(0xffF97316));

      expect(decoration.borderRadius, BorderRadius.circular(8));
    });

    testWidgets('title과 icon 렌더링과 스타일 확인', (tester) async {
      await tester.pumpWidget(buildTestWidget(onTap: () {}, icon: testIcon));

      // Title 확인
      expect(find.text(title), findsOneWidget);

      final textWidget = tester.widget<Text>(find.text(title));
      expect(textWidget.style?.color, const Color(0xffffffff));
      expect(textWidget.style?.fontSize, 12);

      // Icon 확인
      expect(find.byIcon(testIcon), findsOneWidget);
      final iconWidget = tester.widget<Icon>(find.byIcon(testIcon));
      expect(iconWidget.color, const Color(0xffffffff));
      expect(iconWidget.size, 12);
    });

    testWidgets('아이콘 있을 때 Row 정렬은 start', (tester) async {
      await tester.pumpWidget(buildTestWidget(onTap: () {}, icon: testIcon));

      final row = tester.widget<Row>(
        find.descendant(
          of: find.byType(IngredientOrangeButton),
          matching: find.byType(Row),
        ),
      );

      expect(row.mainAxisAlignment, MainAxisAlignment.start);
    });

    testWidgets('아이콘 없을 때 텍스트가 가운데 정렬', (tester) async {
      await tester.pumpWidget(buildTestWidget(onTap: () {}, icon: null));

      final row = tester.widget<Row>(
        find.descendant(
          of: find.byType(IngredientOrangeButton),
          matching: find.byType(Row),
        ),
      );

      expect(row.mainAxisAlignment, MainAxisAlignment.center);

      // Icon이 없어도 텍스트는 존재해야 함.
      expect(find.byIcon(testIcon), findsNothing);
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('GestureDetector onTap 동작 확인', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        buildTestWidget(
          onTap: () => tapped = true,
          icon: testIcon,
        ),
      );

      await tester.tap(find.byType(IngredientOrangeButton));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });

  group('Ingredient Orange Button 골든 테스트', () {
    testWidgets('골든 테스트 - 기본 UI', (tester) async {
      await tester.binding.setSurfaceSize(const Size(120, 48));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: IngredientOrangeButton(
              title: title,
              width: 94,
              icon: Icons.add,
              onTap: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(IngredientOrangeButton),
        matchesGoldenFile('goldens/ingredient_orange_button.png'),
      );
    });
  });
}
