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

      verify(ingredientRepository.getMyIngredient()).called(1);
    });

    test("fetchData 실패 테스트", () {
      when(ingredientRepository.getMyIngredient()).thenThrow(Exception("에러"));

      expect(() async => ingredientViewModel.fetchData(), throwsException);
    });

    test("myFreezedIngredients는 냉동 재료를 올바르게 분류한다", () {
      final freezed = ingredientViewModel.myFreezedIngredients;
      expect(freezed.length, 3);
    });

    test("myFreezedIngredients는 냉장 재료를 올바르게 분류한다", () {
      final unFreezed = ingredientViewModel.myUnfreezedIngredients;
      expect(unFreezed.length, 2);
    });

    test("selectIngredient메소드를 이용해서 새로운 재료를 생성할 수 있다.", () {
      final newIngredient = Ingredient(
        name: "egg",
        category: IngredientCategory.egg,
        isFreezed: false,
      );
      ingredientViewModel.selectIngredient(newIngredient);
      final selectIngredient = ingredientViewModel.selectedIngredient!;
      expect(selectIngredient.name, "egg");
      expect(selectIngredient.category, IngredientCategory.egg);
      expect(selectIngredient.isFreezed, false);
    });

    test("toggleIsFreezed메소드를 이용해서 새로운 재료를 생성할 수 있다.", () {
      final newIngredient = Ingredient(
        name: "egg",
        category: IngredientCategory.egg,
        isFreezed: false,
      );
      ingredientViewModel.selectIngredient(newIngredient);
      ingredientViewModel.toggleIsFreezed(true);
      expect(ingredientViewModel.selectedIngredient!.isFreezed, true);
    });

    test("updateStartAt 메소드로 구매날짜를 갱신할 수 있다.", () {
      final newIngredient = Ingredient(
        name: "egg",
        category: IngredientCategory.egg,
        isFreezed: false,
      );
      ingredientViewModel.selectIngredient(newIngredient);
      ingredientViewModel.updateStartAt(DateTime(2024, 12, 3));
      expect(ingredientViewModel.selectedIngredient!.startAt,
          DateTime(2024, 12, 3));
    });

    test("updateEndAt 메소드로 소비날짜를 갱신할 수 있다.", () {
      final newIngredient = Ingredient(
        name: "egg",
        category: IngredientCategory.egg,
        isFreezed: false,
      );
      ingredientViewModel.selectIngredient(newIngredient);
      ingredientViewModel.updateEndAt(DateTime(2024, 12, 30));
      expect(ingredientViewModel.selectedIngredient!.endAt,
          DateTime(2024, 12, 30));
    });

    test("createNewIngredients는 새로운 재료를 추가한 후 새로운 재료를 재료에 추가한다", () async {
      final newIngredient = Ingredient(
        name: "egg",
        category: IngredientCategory.egg,
        isFreezed: false,
      );
      when(ingredientRepository.createNewIngredient(newIngredient)).thenAnswer(
          (_) async => Ingredient(
              id: 6,
              name: "egg",
              category: IngredientCategory.egg,
              isFreezed: true,
              isFavorite: false,
              startAt: DateTime(2024, 12, 3),
              endAt: DateTime(2024, 12, 30)));

      ingredientViewModel.selectIngredient(newIngredient);
      ingredientViewModel.toggleIsFreezed(true);
      ingredientViewModel.updateStartAt(DateTime(2024, 12, 3));
      ingredientViewModel.updateEndAt(DateTime(2024, 12, 30));
      await ingredientViewModel.createNewIngredient();

      verify(ingredientRepository.createNewIngredient(newIngredient)).called(1);

      expect(ingredientViewModel.myFreezedIngredients.length, 4);
    });
  });
}
