import 'package:yum_application/src/features/recipe/data/domain/entities/recipe_limit.dart';

abstract class RecipeLimitRepository {
  Future<RecipeLimit> getLimit();
  Future<void> saveLimit(RecipeLimit limit);
}
