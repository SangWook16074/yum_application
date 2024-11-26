import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';

import 'ingredient_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IngredientRepository>()])
main() {
  final IngredientRepository ingredientRepository = MockIngredientRepository();
  final IngredientViewModel ingredientViewModel =
      IngredientViewModel(ingredientRepository: ingredientRepository);

  setUpAll(() {});

  group("Ingredient View Model Unit Test", () {});
}
