import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';

import 'ingredient_view_model_test.mocks.dart';

@GenerateMocks([IngredientRepository])
main() {
  late final IngredientRepository ingredientRepository;
  late final IngredientViewModelImpl ingredientViewModel;

  final freezedIngredients = [
    Ingredient(
      id: 1,
      name: "egg",
      category: IngredientCategory.egg,
      isFreezed: true,
      startAt: DateTime(2024, 12, 2),
      endAt: DateTime(2024, 12, 30),
    ),
    Ingredient(
      id: 2,
      name: "beef",
      category: IngredientCategory.beef,
      isFreezed: true,
      startAt: DateTime(2024, 12, 2),
      endAt: DateTime(2024, 12, 30),
    ),
    Ingredient(
      id: 3,
      name: "bread",
      category: IngredientCategory.bread,
      isFreezed: true,
      startAt: DateTime(2024, 12, 2),
      endAt: DateTime(2024, 12, 30),
    ),
  ];

  final unfreezedIngredients = [
    Ingredient(
      id: 4,
      name: "beef",
      category: IngredientCategory.beef,
      isFreezed: false,
      startAt: DateTime(2024, 12, 2),
      endAt: DateTime(2024, 12, 30),
    ),
    Ingredient(
      id: 5,
      name: "bread",
      category: IngredientCategory.bread,
      isFreezed: false,
      startAt: DateTime(2024, 12, 2),
      endAt: DateTime(2024, 12, 30),
    ),
  ];

  group("Ingredient View Model Unit Test", () {
    setUpAll(() {
      ingredientRepository = MockIngredientRepository();
      when(ingredientRepository.getMyIngredient()).thenAnswer(
          (_) async => [...freezedIngredients, ...unfreezedIngredients]);
      ingredientViewModel =
          IngredientViewModelImpl(ingredientRepository: ingredientRepository);
    });

    test("fetchData 메소드가 냉동 재료를 올바르게 분류한다", () async {
      final freezed = ingredientViewModel.myFreezedIngredients;
      expect(freezed.length, 3);
    });

    test("fetchData 메소드가 비냉동 재료를 올바르게 분류한다", () async {
      final unFreezed = ingredientViewModel.myUnfreezedIngredients;
      expect(unFreezed.length, 2);
    });
  });
}
