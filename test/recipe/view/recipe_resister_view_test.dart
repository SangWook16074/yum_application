import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/recipe/view/recipe_%20register_view.dart';
import 'package:yum_application/src/recipe/view/summary_view.dart';

void main() {
  late final widget;
  group("Recipe Resister View Test", () {
    setUpAll(() {
      widget = const MaterialApp(home: RecipeRegisterView());
    });

    testWidgets("레시피 등록 화면이 잘 랜더링 된다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(
          find.byKey(Key("recipe resister view summary view")), findsOneWidget);
      expect(
          find.byKey(Key("recipe register view stepper view")), findsOneWidget);
      expect(
          find.byKey(Key("recipe register view button view")), findsOneWidget);
      expect(find.byKey(Key("Stepper View Button")), findsOneWidget);
    });
  });
}
