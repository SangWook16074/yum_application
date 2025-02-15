import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteDatasourceImpl implements RemoteDatasource {
  final http.Client apiClient;
  final String baseUrl;

  RemoteDatasourceImpl({required this.apiClient, required this.baseUrl});

  /// 나의 냉장고 재료 조회 Api
  ///
  /// statusCode == 200인 경우에 나의 냉장고 재료 데이터를 반환합니다.
  @override
  Future<List<Map<String, dynamic>>> getMyIngredient() async {
    return apiClient
        .get(Uri.parse("$baseUrl/api/ingredients"))
        .then((response) {
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(
            jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        throw jsonDecode(utf8.decode(response.bodyBytes));
      }
    });
  }

  /// 나의 재료 생성 Api
  ///
  /// statusCode == 201인 경우에 새로운 재료를 생성합니다.
  @override
  Future<Map<String, dynamic>> createNewIngredient(
      Map<String, dynamic> json) async {
    return apiClient.post(
      Uri.parse("$baseUrl/api/ingredients"),
      body: jsonEncode(json),
      headers: {"Content-Type": "application/json"},
    ).then((response) {
      if (response.statusCode == 201) {
        return Map<String, dynamic>.from(
            jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        throw jsonDecode(utf8.decode(response.bodyBytes));
      }
    });
  }

  /// 나의 냉장고 재료 수정하기 Api
  ///
  /// statusCode == 200인 경우에 기존의 재료를 갱신할 수 있습니다.
  @override
  Future<Map<String, dynamic>> updateIngredient(
      Map<String, dynamic> json) async {
    return apiClient
        .put(
      Uri.parse("$baseUrl/api/ingredients"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(json),
    )
        .then((response) {
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(
            jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        throw jsonDecode(utf8.decode(response.bodyBytes));
      }
    });
  }

  /// 나의 냉장고 재료 삭제 Api
  ///
  /// statusCode == 204인 경우에 재료를 삭제할 수 있습니다.
  @override
  Future<void> deleteIngredient(int id) {
    return apiClient
        .delete(Uri.parse("$baseUrl/api/ingredients/$id"))
        .then((response) {
      if (response.statusCode == 204) {
        return;
      } else {
        throw jsonDecode(utf8.decode(response.bodyBytes));
      }
    });
  }

  /// 나의 즐겨찾기 재료 불러오기 Api
  ///
  /// statusCode == 200인 경우에 나의 즐겨찾기 재료를 가져옵니다.
  @override
  Future<List<Map<String, dynamic>>> getMyFavoriteIngredient() {
    return apiClient
        .get(Uri.parse("$baseUrl/api/ingredients/favorites"))
        .then((response) {
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(
            jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        throw jsonDecode(utf8.decode(response.bodyBytes));
      }
    });
  }

  /// 나의 즐겨찾기 재료 생성 Api
  ///
  /// statusCode == 200인 경우에 새로운 즐겨찾기 재료를 생성합니다.
  @override
  Future<void> createNewFavoriteIngredient(Map<String, dynamic> json) {
    return apiClient.post(
      Uri.parse("$baseUrl/api/ingredients/favorites"),
      body: jsonEncode(json),
      headers: {"Content-Type": "application/json"},
    ).then((response) {
      if (response.statusCode == 201) {
        return;
      } else {
        throw jsonDecode(utf8.decode(response.bodyBytes));
      }
    });
  }

  /// 나의 즐겨찾기 재료 삭제 Api
  ///
  /// statusCode == 200인 경우에 즐겨찾기 재료를 삭제합니다.
  @override
  Future<void> deleteFavoriteIngredient(Map<String, dynamic> json) {
    return apiClient.delete(
      Uri.parse("$baseUrl/api/ingredients/favorites"),
      body: jsonEncode(json),
      headers: {"Content-Type": "application/json"},
    ).then((response) {
      if (response.statusCode == 200) {
        return;
      } else {
        throw jsonDecode(utf8.decode(response.bodyBytes));
      }
    });
  }
}

abstract class RemoteDatasource {
  Future<List<Map<String, dynamic>>> getMyIngredient();

  Future<Map<String, dynamic>> createNewIngredient(Map<String, dynamic> json);

  Future<Map<String, dynamic>> updateIngredient(Map<String, dynamic> json);

  Future<List<Map<String, dynamic>>> getMyFavoriteIngredient();

  Future<void> deleteIngredient(int id);

  Future<void> createNewFavoriteIngredient(Map<String, dynamic> json);

  Future<void> deleteFavoriteIngredient(Map<String, dynamic> json);
}
