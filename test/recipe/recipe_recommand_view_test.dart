import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/recipe/pages/recipe_recommand_view.dart';

void main() {
  group('should user button tap count decrease corectly', () {
    testWidgets('버튼 클릭 시 remainingCount 감소', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RecipeRecommandView()));

      expect(find.text('3 회 남음'), findsOneWidget);

      await tester.tap(find.text('새 레시피 추천받기'));
      await tester.pumpAndSettle();
      expect(find.text('2 회 남음'), findsOneWidget);

      await tester.tap(find.text('새 레시피 추천받기'));
      await tester.pumpAndSettle();
      expect(find.text('1 회 남음'), findsOneWidget);

      await tester.tap(find.text('새 레시피 추천받기'));
      await tester.pumpAndSettle();
      expect(find.text('0 회 남음'), findsOneWidget);

      await tester.tap(find.text('새 레시피 추천받기'));
      await tester.pumpAndSettle();
    });
  });
}
