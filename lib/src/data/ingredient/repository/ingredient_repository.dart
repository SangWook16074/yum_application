import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  final RemoteDatasource remoteDatasource;

  IngredientRepositoryImpl({required this.remoteDatasource});

  /// 나의 냉장고 재료 조회 Api
  @override
  Future<List<Ingredient>> getMyIngredient() async {
    return remoteDatasource.getMyIngredient().then((response) =>
        response.map((json) => Ingredient.fromJson(json)).toList());
  }

  /// 나의 재료 생성 Api
  @override
  Future<Ingredient> createNewIngredient(Ingredient ingredient) async {
    final response =
        await remoteDatasource.createNewIngredient(ingredient.toJson());
    return Ingredient.fromJson(response);
  }
}

abstract class IngredientRepository {
  Future<List<Ingredient>> getMyIngredient();

  Future<Ingredient> createNewIngredient(Ingredient ingredient);
}
