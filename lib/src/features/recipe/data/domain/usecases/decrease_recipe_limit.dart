import 'package:yum_application/src/features/recipe/data/domain/entities/recipe_limit.dart';
import 'package:yum_application/src/features/recipe/data/domain/repositories/recipe_limit_repository.dart';

class DecreaseRecipeLimit {
  final RecipeLimitRepository repository;

  DecreaseRecipeLimit(this.repository);

  Future<RecipeLimit> call() async {
    final limit = await repository.getLimit();
    final updated = limit.decrease();
    await repository.saveLimit(updated);
    return updated;
  }
}
