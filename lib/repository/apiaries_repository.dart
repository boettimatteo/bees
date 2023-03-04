import 'package:bees/api_client.dart';
import 'package:bees/models/apiary_response.dart';
import 'package:dio/dio.dart';

class ApiariesRepository {
  final ApiClient client;

  ApiariesRepository(
    this.client,
  );

  Future<Response<ApiaryResponse>> getApiaries({
    required int page,
    Options? options,
  }) async {
    options ??= Options();

    final token = await client.tokenManager.readToken();

    options.headers = {
      "Authorization": "Bearer ${token.access}",
    };

    try {
      final response = await client.dio.get<Map<String, dynamic>>(
        "/apiaries/",
        options: options,
        queryParameters: {
          "page": page,
        },
      );

      if (response.data == null) {
        throw Exception("ERR.EMPTY_RESPONSE");
      }

      final apiaryResponse = ApiaryResponse.fromJson(response.data!);

      return Response<ApiaryResponse>(
        requestOptions: response.requestOptions,
        data: apiaryResponse,
      );
    } catch (e) {
      rethrow;
    }
  }
}
