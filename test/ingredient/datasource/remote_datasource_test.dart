import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:yum_application/src/data/ingredient/datasource/remote_datasource.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  late final MockClient apiClient;
  const baseUrl = String.fromEnvironment("BASE_URL");
  late final RemoteDatasource remoteDatasource;

  group("Ingredient Remote Datasource Unit Test", () {
    setUpAll(() {
      apiClient = MockClient();
      remoteDatasource =
          RemoteDatasourceImpl(apiClient: apiClient, baseUrl: baseUrl);
    });
    test("'/api/ingredients' GET요청이 성공하면 사용자의 재료 데이터를 반환한다", () async {
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
      verify(apiClient.get(Uri.parse("$baseUrl/api/ingredients"))).called(1);
      expect(result.length, 1);
    });

    test("'/api/ingredients' POST요청이 성공하면 사용자의 생성한 재료 데이터를 반환한다", () async {
      final testBody = {
        "name": "egg",
        "isFreezed": false,
        "category": "egg",
        "startAt": "2024-11-12",
        "endAt": "2024-11-17"
      };
      when(apiClient.post(
        Uri.parse("$baseUrl/api/ingredients"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response('''
            {
              "name" : "egg", 
              "isFreezed" : false, 
              "category": "egg",
              "startAt" : "2024-11-12", 
              "endAt": "2024-11-17"
            }
''', 201));

      final result = await remoteDatasource.createNewIngredient(testBody);
      verify(apiClient.post(
        Uri.parse("$baseUrl/api/ingredients"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).called(1);
      expect(result["name"], "egg");
    });

    test("'/api/ingredients PUT 요청이 성공하면 갱신된 재료 데이터를 반환한다.'", () async {
      final testBody = {
        "id": 1,
        "name": "egg",
        "isFreezed": false,
        "category": "egg",
        "startAt": "2024-11-12",
        "endAt": "2024-11-17"
      };

      when(apiClient.put(
        Uri.parse("$baseUrl/api/ingredients"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).thenAnswer((_) async => http.Response('''
            {
              "name" : "egg", 
              "isFreezed" : false, 
              "category": "egg",
              "startAt" : "2024-11-12", 
              "endAt": "2024-11-17"
            }
''', 200));

      final result = await remoteDatasource.updateIngredient(testBody);
      verify(apiClient.put(
        Uri.parse("$baseUrl/api/ingredients"),
        body: jsonEncode(testBody),
        headers: {"Content-Type": "application/json"},
      )).called(1);
      expect(result["name"], "egg");
    });
  });
}
