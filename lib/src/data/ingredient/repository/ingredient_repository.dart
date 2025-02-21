import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/entity/ingredient_category.dart';
import 'package:yum_application/src/data/ingredient/entity/refreginator_ingredient.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  final RemoteDatasource remoteDatasource;

  IngredientRepositoryImpl({required this.remoteDatasource});

  /// 나의 냉장고 재료 조회 Api
  @override
  Future<List<RefreginatorIngredient>> getMyIngredient() {
    return remoteDatasource.getMyIngredient().then((response) =>
        response.map((json) => RefreginatorIngredient.fromJson(json)).toList());
  }

  /// 나의 재료 생성 Api
  @override
  Future<RefreginatorIngredient> createNewIngredient(
      RefreginatorIngredient ingredient) {
    return remoteDatasource
        .createNewIngredient(ingredient.toJson())
        .then((response) => RefreginatorIngredient.fromJson(response));
  }

  /// 나의 재료 수정 Api
  @override
  Future<RefreginatorIngredient> updateIngredient(
      RefreginatorIngredient ingredient) async {
    return remoteDatasource
        .updateIngredient(ingredient.toJson())
        .then((response) => RefreginatorIngredient.fromJson(response));
  }

  /// 나의 재료 삭제 Api
  @override
  Future<void> deleteIngredient(int id) {
    return remoteDatasource.deleteIngredient(id);
  }

  // 나의 즐겨찾기 재료 Api
  @override
  Future<List<IngredientCategory>> getMyFavoriteIngredient() {
    return remoteDatasource.getMyFavoriteIngredient().then((response) =>
        response.map((json) => IngredientCategory.fromJson(json)).toList());
  }

  /// 나의 즐겨찾기 재료 생성 Api
  @override
  Future<void> createNewFavoriteIngredient(IngredientCategory category) {
    return remoteDatasource.createNewFavoriteIngredient(category.toJson());
  }

  /// 나의 즐겨찾기 재료 삭제 Api
  @override
  Future<void> deleteFavoriteIngredient(IngredientCategory category) {
    return remoteDatasource.deleteFavoriteIngredient(category.toJson());
  }
}

abstract class IngredientRepository {
  Future<List<RefreginatorIngredient>> getMyIngredient();

  Future<RefreginatorIngredient> createNewIngredient(
      RefreginatorIngredient ingredient);

  Future<RefreginatorIngredient> updateIngredient(
      RefreginatorIngredient ingredient);

  Future<List<IngredientCategory>> getMyFavoriteIngredient();

  Future<void> deleteIngredient(int id);

  Future<void> createNewFavoriteIngredient(IngredientCategory category);

  Future<void> deleteFavoriteIngredient(IngredientCategory category);
}
