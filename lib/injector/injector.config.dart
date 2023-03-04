// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api_client.dart' as _i4;
import '../managers/token_manager.dart' as _i3;
import '../repository/apiaries_repository.dart' as _i5;
import '../repository/user_repository.dart' as _i6;
import 'modules/repository_module.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final repositoryModule = _$RepositoryModule();
  gh.lazySingleton<_i3.TokenManager>(() => _i3.TokenManager());
  gh.lazySingleton<_i4.ApiClient>(
      () => repositoryModule.apiClient(get<_i3.TokenManager>()));
  gh.lazySingleton<_i5.ApiariesRepository>(
      () => repositoryModule.apiariesRepository(get<_i4.ApiClient>()));
  gh.lazySingleton<_i6.UserRepository>(
      () => repositoryModule.userRepository(get<_i4.ApiClient>()));
  return get;
}

class _$RepositoryModule extends _i7.RepositoryModule {}
