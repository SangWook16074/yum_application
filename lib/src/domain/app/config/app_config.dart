import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:http/http.dart' as http;
import 'package:yum_application/src/ingredient/viewModel/basic_ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';

List<ChangeNotifierProvider> getInitProvider() {
  final String baseUrl = dotenv.get("BASE_URL");
  final RemoteDatasource remoteDatasource =
      RemoteDatasourceImpl(apiClient: http.Client(), baseUrl: baseUrl);
  final IngredientRepositoryImpl ingredientRepositoryImpl =
      IngredientRepositoryImpl(remoteDatasource: remoteDatasource);
  return [
    ChangeNotifierProvider<IngredientViewModelImpl>(
        create: (context) => IngredientViewModelImpl(
            ingredientRepository: ingredientRepositoryImpl)),
    ChangeNotifierProvider<BasicIngredientViewModel>(
        create: (context) => BasicIngredientViewModel(
            ingredientRepository: ingredientRepositoryImpl)),
  ];
}
