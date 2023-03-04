import 'package:bees/api_client.dart';
import 'package:bees/models/token.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final ApiClient client;

  UserRepository(this.client);

  Future<Response<Token>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.dio.post<Map<String, dynamic>>(
        "/auth/jwt/create/",
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.data == null) {
        throw Exception("ERR.EMPTY_RESPONSE");
      }

      final token = Token.fromJson(response.data!);

      await client.tokenManager.writeToken(token);

      return Response<Token>(
        requestOptions: response.requestOptions,
        data: token,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        isRedirect: response.isRedirect,
        extra: response.extra,
        headers: response.headers,
      );
    } catch (e) {
      await client.tokenManager.deleteToken();
      rethrow;
    }
  }
}
