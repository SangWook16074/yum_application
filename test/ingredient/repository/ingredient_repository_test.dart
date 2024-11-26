import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';

import 'ingredient_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<RemoteDatasource>()])
void main() {
  final RemoteDatasource remoteDatasource = MockRemoteDatasource();
  final IngredientRepository ingredientRepository =
      IngredientRepository(remoteDatasource: remoteDatasource);
  group("Ingredient Repository Unit Test", () {
    test("getAllIngredient 요청이 성공하면 List<Ingredient>가 반환된다", () async {
      when(remoteDatasource.getMyIngredient()).thenAnswer((_) async => [
            {
              "id": 1,
              "name": "egg",
              "isFreezed": false,
              "isFavorite": false,
              "category": "egg",
              "startAt": "2024-11-12",
              "endAt": "2024-11-17"
            }
          ]);
      final result = await ingredientRepository.getMyIngredient();
      expect(result, isA<List<Ingredient>>());
    });

    test("getAllIngredient 요청이 성공하면 <Ingredient>가 반환된다", () async {
      final json = {
        "name": "egg",
        "isFreezed": false,
        "category": "egg",
        "startAt": "2024-11-12",
        "endAt": "2024-11-17"
      };

      final Ingredient ingredient = Ingredient(
          name: "egg",
          category: IngredientCategory.egg,
          isFreezed: false,
          startAt: DateTime(2024, 11, 12),
          endAt: DateTime(2024, 11, 17));
      when(remoteDatasource.createNewIngredient(ingredient.toJson()))
          .thenAnswer((_) async => {
                "id": 1,
                "name": "egg",
                "isFreezed": false,
                "isFavorite": false,
                "category": "egg",
                "startAt": "2024-11-12",
                "endAt": "2024-11-17"
              });

      final result = await ingredientRepository.createNewIngredient(ingredient);
      expect(result, isA<Ingredient>());
    });
  });
}
