import 'package:bees/api_client.dart';
import 'package:bees/managers/token_manager.dart';
import 'package:bees/repository/apiaries_repository.dart';
import 'package:bees/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RepositoryModule {
  @LazySingleton()
  ApiClient apiClient(TokenManager tokenManager) {
    return ApiClient(
      dio: Dio(),
      tokenManager: tokenManager,
    );
  }

  @LazySingleton()
  UserRepository userRepository(ApiClient client) {
    return UserRepository(client);
  }

  @LazySingleton()
  ApiariesRepository apiariesRepository(ApiClient client) {
    return ApiariesRepository(client);
  }
}
