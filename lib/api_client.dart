import 'package:bees/managers/token_manager.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  final TokenManager tokenManager;
  final String baseUrl = "https://api.3bee.com/api/v1/";

  ApiClient({
    required this.dio,
    required this.tokenManager,
  }) {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
    );
  }
}
