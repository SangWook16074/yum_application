import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteDatasourceImpl implements RemoteDatasource {
  final http.Client apiClient;
  final String baseUrl;

  RemoteDatasourceImpl({required this.apiClient, required this.baseUrl});

  /// 나의 냉장고 재료 조회 Api
  @override
  Future<List<Map<String, dynamic>>> getMyIngredient() async {
    return apiClient.get(Uri.parse("$baseUrl/api/ingredients")).then(
        (response) => List<Map<String, dynamic>>.from(
            jsonDecode(utf8.decode(response.bodyBytes))));
  }

  /// 나의 재료 생성 Api
  @override
  Future<Map<String, dynamic>> createNewIngredient(
      Map<String, dynamic> json) async {
    return apiClient
        .post(Uri.parse("$baseUrl/api/ingredients"), body: json)
        .then((respone) => Map<String, dynamic>.from(
            jsonDecode(utf8.decode(respone.bodyBytes))));
  }

  /// 나의 냉장고 재료 수정하기 Api
  @override
  Future<Map<String, dynamic>> editIngredient(Map<String, dynamic> json) async {
    return apiClient
        .put(Uri.parse("$baseUrl/api/ingredients"), body: json)
        .then((respone) => Map<String, dynamic>.from(
            jsonDecode(utf8.decode(respone.bodyBytes))));
  }
}

abstract class RemoteDatasource {
  Future<List<Map<String, dynamic>>> getMyIngredient();

  Future<Map<String, dynamic>> createNewIngredient(Map<String, dynamic> json);

  Future<Map<String, dynamic>> editIngredient(Map<String, dynamic> json);
}
