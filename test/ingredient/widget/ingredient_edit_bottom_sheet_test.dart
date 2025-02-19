import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/data/ingredient/model/initial_ingredient.dart';
import 'package:yum_application/src/data/ingredient/model/refreginator_ingredient.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_edit_bottom_sheet.dart';

void main() {
  late final RefreginatorIngredient ingredient;
  late final Widget widget;

  group("Ingredient Edit Bottom Sheet Widget Test", () {
    setUpAll(() {
      ingredient = RefreginatorIngredient(
          name: "egg",
          category: IngredientCategory.egg,
          isFreezed: false,
          startAt: DateTime(2024, 11, 12),
          endAt: DateTime(2024, 11, 30));
      widget = MaterialApp(
        home: IngredientEditBottomSheet(ingredient: ingredient),
      );
    });
    testWidgets("재료가 주어지면 Ingredient Edit Bottom Sheet가 잘 랜더링 된다.",
        (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("Ingredient Edit Bottom Sheet Top")),
          findsOneWidget);
      expect(find.byKey(const Key("Ingredient Edit Bottom Sheet Middle")),
          findsOneWidget);
      expect(find.byKey(const Key("Ingredient Edit Bottom Sheet Bottom")),
          findsOneWidget);
    });

    testWidgets("재료의 남은 기한이 잘 랜더링 된다.", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      final now = DateTime.now();
      final diff = (ingredient.endAt.difference(now).inHours / 24).ceil();
      expect(
          find.bySemanticsLabel(
              (diff >= 0) ? "소비기한이 $diff일 남았어요!" : "소비기한이 ${-diff}일 지났어요!"),
          findsOneWidget);
    });

    testWidgets("재료의 생산일과 유통기한이 잘 랜더링 된다.", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      final start = ingredient.startAt;
      final end = ingredient.endAt;

      expect(
          find.bySemanticsLabel(
              "${start.year}년 ${start.month}월 ${start.day}일 ~ ${end.year}년 ${end.month}월 ${end.day}일"),
          findsOneWidget);
    });

    testWidgets("재료의 이름이 잘 랜더링 된다.", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      final name = ingredient.name;

      expect(find.bySemanticsLabel(name), findsOneWidget);
    });
  });
}
