import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final apiClient = MockClient();
  final RemoteDatasource remoteDatasource =
      RemoteDatasource(apiClient: apiClient);
  const String baseUrl =
      "http://ec2-43-203-35-91.ap-northeast-2.compute.amazonaws.com:8080/api/ingredients";
  group("Ingredient Remote Datasource Unit Test", () {
    test("http 요청이 성공하면 사용자의 재료 데이터를 반환한다", () async {
      when(apiClient.get(Uri.parse(baseUrl)))
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
  });
}
