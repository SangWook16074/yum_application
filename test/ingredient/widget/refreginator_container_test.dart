import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/data/ingredient/model/basic_ingredient.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_image.dart';
import 'package:yum_application/src/ingredient/widget/refreginator_container.dart';

void main() {
  group("Refreginator Container Widget Test", () {
    testWidgets("빈 아이템이 전달되면 랜덤한 6개의 문구 중 하나가 랜더링된다",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RefreginatorContainer(children: [], label: "test label"),
      ));

      expect(find.text("test label"), findsOneWidget);
      expect(
          find.byKey(const Key("Random empty string widget")), findsOneWidget);
      expect(find.byKey(const Key("Ingredient Page View")), findsNothing);
    });

    testWidgets("아이템의 개수가 rowCount * 4개보다 작거나 같은 경우에는 indicator가 랜더링 되지 않는다",
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RefreginatorContainer(children: [], label: "test label"),
      ));

      expect(find.byKey(const Key("Indicator")), findsNothing);
    });

    testWidgets("Item Row는 전달된 rowCount만큼 랜더링된다", (WidgetTester tester) async {
      final testIngredients = List.generate(
        10,
        (_) => Ingredient(
            name: "egg",
            category: IngredientCategory.egg,
            isFreezed: false,
            startAt: DateTime.now(),
            endAt: DateTime.now()),
      );
      await tester.pumpWidget(MaterialApp(
        home: RefreginatorContainer(
            children: testIngredients, label: "test label"),
      ));
      expect(find.byType(Stack), findsAtLeastNWidgets(2));
    });

    testWidgets("아이템이 채워지지 않은 칸은 Empty Item으로 채워진다.",
        (WidgetTester tester) async {
      final testIngredients = [
        Ingredient(
            name: "egg",
            category: IngredientCategory.egg,
            isFreezed: false,
            startAt: DateTime.now(),
            endAt: DateTime.now()),
      ];
      await tester.pumpWidget(MaterialApp(
        home: RefreginatorContainer(
            children: testIngredients, label: "test label"),
      ));

      expect(find.byType(Opacity), findsAtLeast(7));
    });

    testWidgets("아이템이 rowCount * 4보다 많은 경우에는 최대 rowCount * 4개의 아이템을 보여준다",
        (WidgetTester tester) async {
      final testIngredients = List.generate(
        10,
        (_) => Ingredient(
            name: "egg",
            category: IngredientCategory.egg,
            isFreezed: false,
            startAt: DateTime.now(),
            endAt: DateTime.now()),
      );
      await tester.pumpWidget(MaterialApp(
        home: RefreginatorContainer(
            children: testIngredients, label: "test lable"),
      ));
      expect(find.byType(IngredientImage), findsAtLeast(8));
    });
  });
}
