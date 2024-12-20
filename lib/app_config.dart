import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';
import 'package:yum_application/src/ingredient/viewModel/basic_ingredient_view_model.dart';
import 'package:yum_application/src/ingredient/viewModel/ingredient_view_model.dart';
import 'package:http/http.dart' as http;

List<ChangeNotifierProvider> getInitProvider() {
  final String baseUrl = dotenv.get("BASE_URL");
  return [
    ChangeNotifierProvider<IngredientViewModelImpl>(
        create: (context) => IngredientViewModelImpl(
            ingredientRepository: IngredientRepositoryImpl(
                remoteDatasource: RemoteDatasourceImpl(
                    apiClient: http.Client(), baseUrl: baseUrl)))),
    ChangeNotifierProvider<BasicIngredientViewModel>(
        create: (context) => BasicIngredientViewModel()),
  ];
}
