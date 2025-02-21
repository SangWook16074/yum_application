import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/ingredient/widget/ingredient_filter_check_box.dart';

void main() {
  late Widget widget;

  bool value = false;

  void changeValue(bool val) {
    value = val;
  }

  group("Ingredient Filter Check Box Widget Test", () {
    setUp(() {
      widget = MaterialApp(
        home: IngredientFilterCheckBox(
            value: value, label: "test label", onChanged: changeValue),
      );
    });

    testWidgets("사용자는 위젯의 label을 지정할 수 있다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.bySemanticsLabel("test label"), findsOneWidget);
    });

    testWidgets("사용자는 onChanged를 통해서 value를 토글하면 false 에서 true를 반환받는다.",
        (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("ingredient-filter-off-check-box")),
          findsOneWidget);
      expect(find.byKey(const Key("ingredient-filter-on-check-box")),
          findsNothing);

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key("ingredient-filter-off-check-box")),
          findsNothing);
      expect(find.byKey(const Key("ingredient-filter-on-check-box")),
          findsOneWidget);
    });
  });
}
