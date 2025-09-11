import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/ui/recipe/pages/recipe_recommand_view.dart';

void main() {
  testWidgets('RecipeRecommandView Golden Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RecipeRecommandView(),
      ),
    );

    await expectLater(
      find.byType(RecipeRecommandView),
      matchesGoldenFile('goldens/recipe_recommand_view.png'),
    );
  });
}
