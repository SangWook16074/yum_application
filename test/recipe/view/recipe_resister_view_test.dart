import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/data/recipe/repository/recipe_respository.dart';
import 'package:yum_application/src/ui/recipe/viewModel/recipe_view_model.dart';
import 'package:yum_application/src/ui/recipe/view/recipe_%20register_view.dart';

import 'recipe_resister_view_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RecipeRepository>()])
void main() {
  late final MockRecipeRepository mockRecipeRepository;
  late final MaterialApp widget;
  group("Recipe Resister View Test", () {
    setUpAll(() {
      mockRecipeRepository = MockRecipeRepository();
      widget = MaterialApp(
          home: ChangeNotifierProvider(
              create: (context) =>
                  RecipeViewModel(recipeRepository: mockRecipeRepository),
              child: RecipeRegisterView()));
    });

    testWidgets("레시피 등록 화면이 잘 랜더링 된다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("recipe resister view summary view")),
          findsOneWidget);
      expect(find.byKey(const Key("recipe register view stepper view")),
          findsOneWidget);
      expect(find.byKey(const Key("recipe register view button view")),
          findsOneWidget);
      expect(find.byKey(const Key("Stepper View Button")), findsOneWidget);
    });
  });
}
