import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

/// 앱 전역에서 사용되는 HTTP 통신 객체
///
/// 앱이 종료되면 종료됨.
final clientProvider = Provider<http.Client>(
  create: (context) => http.Client(),
  dispose: (context, client) => client.close(),
);
