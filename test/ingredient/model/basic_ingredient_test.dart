import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/data/ingredient/model/initial_ingredient.dart';

void main() {
  group("Basic Ingredient Model Unit Test", () {
    test("copy를 통해서 새로운 Initial Ingredient를 생성한다.", () {
      final ingredient = InitialIngredient(
        name: "egg",
        isFavorite: false,
        category: IngredientCategory.egg,
      );
      final newIngredient = ingredient.copy(isFavorite: true);
      expect(newIngredient.name, "egg");
      expect(newIngredient.isFavorite, true);
      expect(newIngredient.category, IngredientCategory.egg);
    });
  });
}
