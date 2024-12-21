import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/model/basic_ingredient.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';

import 'ingredient_repository_test.mocks.dart';

@GenerateMocks([RemoteDatasource])
void main() {
  late final RemoteDatasource remoteDatasource;
  late final IngredientRepositoryImpl ingredientRepository;
  group("Ingredient Repository Unit Test", () {
    setUpAll(() {
      remoteDatasource = MockRemoteDatasource();
      ingredientRepository =
          IngredientRepositoryImpl(remoteDatasource: remoteDatasource);
    });

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
      verify(remoteDatasource.getMyIngredient()).called(1);
      expect(result, isA<List<Ingredient>>());
      final first = result.first;
      expect(first.id, 1);
      expect(first.name, "egg");
      expect(first.isFreezed, false);
      expect(first.category, IngredientCategory.egg);
      expect(first.startAt, DateTime(2024, 11, 12));
      expect(first.endAt, DateTime(2024, 11, 17));
    });

    test("getAllIngredient 요청이 성공하면 Ingredient가 반환된다", () async {
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
      verify(remoteDatasource.createNewIngredient(ingredient.toJson()))
          .called(1);
      expect(result, isA<Ingredient>());
      expect(result.name, "egg");
      expect(result.isFreezed, false);
      expect(result.category, IngredientCategory.egg);
      expect(result.startAt, DateTime(2024, 11, 12));
      expect(result.endAt, DateTime(2024, 11, 17));
    });
  });
}
