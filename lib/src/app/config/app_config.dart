import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ingredient/viewModel/initial_ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:http/http.dart' as http;

List<ChangeNotifierProvider> getInitProvider() {
  final String baseUrl = dotenv.get("BASE_URL");
  final RemoteDatasource remoteDatasource =
      RemoteDatasourceImpl(apiClient: http.Client(), baseUrl: baseUrl);
  final IngredientRepositoryImpl ingredientRepositoryImpl =
      IngredientRepositoryImpl(remoteDatasource: remoteDatasource);

  final RefreginatorIngredientViewModel ingredientViewModel =
      RefreginatorIngredientViewModel(
          ingredientRepository: ingredientRepositoryImpl);

  final InitialIngredientViewModel basicIngredientViewModel =
      InitialIngredientViewModel(
          ingredientRepository: ingredientRepositoryImpl);

  /// 재료 뷰모델에서
  /// 재료 가져와서 정렬한 다음에
  /// 3 개만 뽑기
  /// 그리고 레시피 뷰모델 생성할 때,
  /// 3 개 전달

  return [
    ChangeNotifierProvider<RefreginatorIngredientViewModel>(
        create: (context) => ingredientViewModel),
    ChangeNotifierProvider<InitialIngredientViewModel>(
        create: (context) => basicIngredientViewModel),
  ];
}
