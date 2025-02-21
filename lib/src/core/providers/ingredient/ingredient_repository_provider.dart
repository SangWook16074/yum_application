import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';
import 'package:yum_application/src/data/ingredient/repository/ingredient_repository.dart';

/// [Ingredient]관련 서버 통신 Provider
final ingredientRepositoryProvider = [
  /// [RemoteDatasource] 주입
  Provider<RemoteDatasource>(
    create: (context) => RemoteDatasourceImpl(
        apiClient: context.read<http.Client>(),
        baseUrl: dotenv.get("BASE_URL")),
  ),

  /// [IngredientRepository] 주입
  Provider<IngredientRepository>(
    create: (context) => IngredientRepositoryImpl(
        remoteDatasource: context.read<RemoteDatasource>()),
  )
];
