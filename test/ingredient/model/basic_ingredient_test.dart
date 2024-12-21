import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/data/ingredient/model/basic_ingredient.dart';

void main() {
  group("Basic Ingredient Model Unit Test", () {
    test("copy를 통해서 새로운 Basic Ingredient를 생성한다.", () {
      final ingredient = BasicIngredient(
          name: "egg",
          isFavorite: false,
          category: IngredientCategory.egg,
          type: IngredientType.meatsAndEggs);
      final newIngredient = ingredient.copy(isFavorite: true);
      expect(newIngredient.name, "egg");
      expect(newIngredient.isFavorite, true);
      expect(newIngredient.category, IngredientCategory.egg);
      expect(newIngredient.type, IngredientType.meatsAndEggs);
    });
  });
}
