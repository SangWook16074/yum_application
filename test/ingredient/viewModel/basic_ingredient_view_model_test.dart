import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/entity/ingredient_category.dart';
import 'package:yum_application/src/ui/ingredient/model/basic_ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ui/ingredient/viewModel/basic_ingredient_view_model.dart';

import 'basic_ingredient_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IngredientRepositoryImpl>()])
void main() {
  late final MockIngredientRepositoryImpl ingredientRepository;
  late final BasicIngredientViewModel viewModel;

  group("Basic Ingredient View Model Unit Test", () {
    setUpAll(() {
      ingredientRepository = MockIngredientRepositoryImpl();
      when(ingredientRepository.getMyFavoriteIngredient())
          .thenAnswer((_) async => []);
      viewModel =
          BasicIngredientViewModel(ingredientRepository: ingredientRepository);
    });
    test("allIngredients는 전체 재료가 모두 반환된다.", () {
      final result = viewModel.allBasicIngredients;
      expect(result.isNotEmpty, true);
    });

    test("carbohydrate를 통해서 밥 빵 면 식재료가 반환된다.", () {
      final result =
          viewModel.getBasicIngredientBy(IngredientType.carbohydrate);
      for (var i in result) {
        expect(i.type, IngredientType.carbohydrate);
      }
    });

    test("vegetables를 통해서 야채 및 과일 식재료가 반환된다.", () {
      final result = viewModel.getBasicIngredientBy(IngredientType.vegetable);
      for (var i in result) {
        expect(i.type, IngredientType.vegetable);
      }
    });

    test("meatsAndEggs를 통해서 육류 및 계란 식재료가 반환된다.", () {
      final result =
          viewModel.getBasicIngredientBy(IngredientType.meatsAndEggs);

      for (var i in result) {
        expect(i.type, IngredientType.meatsAndEggs);
      }
    });

    test("fishAndShrimp를 통해서 생선류 식재료가 반환된다.", () {
      final result =
          viewModel.getBasicIngredientBy(IngredientType.fishAndShrimp);

      for (var i in result) {
        expect(i.type, IngredientType.fishAndShrimp);
      }
    });

    test("processedFood를 통해서 가공류 식재료가 반환된다.", () {
      final result =
          viewModel.getBasicIngredientBy(IngredientType.processedFood);
      for (var i in result) {
        expect(i.type, IngredientType.processedFood);
      }
    });

    test("milkAndNuts를 통해서 유제품 및 견과류 식재료가 반환된다.", () {
      final result = viewModel.getBasicIngredientBy(IngredientType.milkAndNuts);
      for (var i in result) {
        expect(i.type, IngredientType.milkAndNuts);
      }
    });

    test("drink를 통해서 주류 식재료가 반환된다.", () {
      final result = viewModel.getBasicIngredientBy(IngredientType.drink);
      for (var i in result) {
        expect(i.type, IngredientType.drink);
      }
    });

    test("favorite을 통해서 즐겨찾기 식재료가 반환된다.", () {
      viewModel.toggleIsFavorite(IngredientCategory.beef);
      final result = viewModel.favorites;
      expect(result.length, 1);
      expect(result.first, isA<BasicIngredient>());
    });

    test("toggleIsFavorite을 통해 즐겨찾기 재료가 추가 삭제된다.", () {
      viewModel.toggleIsFavorite(IngredientCategory.beef);
      final beef = viewModel.allBasicIngredients
          .where((ingredient) => ingredient.category == IngredientCategory.beef)
          .first;
      expect(beef.isFavorite, false);
    });

    test("favorite을 통해서 즐겨찾기 식재료가 반환된다.", () {
      viewModel.toggleIsFavorite(IngredientCategory.beef);
      final result = viewModel.favorites;
      expect(result.length, 1);
      expect(result.first, isA<BasicIngredient>());
    });
  });
}
