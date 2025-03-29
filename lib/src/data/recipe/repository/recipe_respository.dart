import 'package:yum_application/src/data/recipe/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/recipe/model/recipe.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RemoteDatasource remoteDatasource;

  RecipeRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<Recipe>> getAllRecipes({int page = 0, int size = 10}) async {
    final response =
        await remoteDatasource.getAllRecipes(page: page, size: size);
    return response.map((json) => Recipe.fromJson(json)).toList();
  }
}

abstract class RecipeRepository {
  Future<List<Recipe>> getAllRecipes({int page, int size});
}
