import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  final apiClient = MockClient();
  const baseUrl = String.fromEnvironment("BASE_URL");
  final RemoteDatasource remoteDatasource =
      RemoteDatasource(apiClient: apiClient, baseUrl: baseUrl);
  group("Ingredient Remote Datasource Unit Test", () {
    test("http 요청이 성공하면 사용자의 재료 데이터를 반환한다", () async {
      when(apiClient.get(Uri.parse("$baseUrl/api/ingredients")))
          .thenAnswer((_) async => http.Response('''
          [
            {
              "id" : 1, 
              "name" : "egg", 
              "isFreezed" : false, 
              "isFavorite": false, 
              "category": "egg",
              "startAt" : "2024-11-12", 
              "endAt": "2024-11-17"
            }
          ]
          ''', 200));
      final result = await remoteDatasource.getMyIngredient();
      expect(result.length, 1);
    });

    test("http 요청이 성공하면 사용자의 생성한 재료 데이터를 반환한다", () async {
      final testBody = {
        "name": "egg",
        "isFreezed": false,
        "category": "egg",
        "startAt": "2024-11-12",
        "endAt": "2024-11-17"
      };
      when(apiClient.post(Uri.parse("$baseUrl/api/ingredients"),
              body: testBody))
          .thenAnswer((_) async => http.Response('''
            {
              "name" : "egg", 
              "isFreezed" : false, 
              "category": "egg",
              "startAt" : "2024-11-12", 
              "endAt": "2024-11-17"
            }
''', 201));

      final result = await remoteDatasource.createNewIngredient(testBody);
      expect(result["name"], "egg");
    });
  });
}
