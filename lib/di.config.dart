// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pizzajournals/data/repositories/user_repository.dart' as _i2;
import 'package:pizzajournals/data/repositories/user_repository.default.dart'
    as _i556;
import 'package:pizzajournals/data/source/local/user_local_datasource.dart'
    as _i768;
import 'package:pizzajournals/data/source/network/device_datasource.dart'
    as _i115;
import 'package:pizzajournals/data/source/network/network.dart' as _i425;
import 'package:pizzajournals/data/source/network/user_datasource.dart'
    as _i161;
import 'package:pizzajournals/data/states/action/action_bloc.dart' as _i344;
import 'package:pizzajournals/data/states/auth/auth_bloc.dart' as _i982;
import 'package:pizzajournals/data/states/discover/discover_bloc.dart' as _i310;
import 'package:pizzajournals/data/states/notification/notification_bloc.dart'
    as _i811;
import 'package:pizzajournals/data/states/profile/profile_bloc.dart' as _i441;
import 'package:pizzajournals/data/states/settings/settings_bloc.dart' as _i194;
import 'package:pizzajournals/data/states/suggestion/suggestions_bloc.dart'
    as _i974;
import 'package:pizzajournals/di.dart' as _i911;
import 'package:pizzajournals/presenter/navigation/navigation.dart' as _i1052;
import 'package:pizzajournals/services/image_service.dart' as _i539;
import 'package:pizzajournals/services/permission_service.dart' as _i615;
import 'package:pizzajournals/utils/alert_manager.dart' as _i651;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i558.FlutterSecureStorage>(() => registerModule.storage);
    gh.singleton<_i194.SettingsBloc>(() => _i194.SettingsBloc());
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i1052.AppRouter>(() => registerModule.router);
    gh.singleton<_i768.UserLocalDataSource>(() =>
        _i768.UserLocalDataSource(storage: gh<_i558.FlutterSecureStorage>()));
    gh.singleton<_i425.NetworkManager>(
        () => _i425.NetworkManager(dio: gh<_i361.Dio>()));
    gh.singleton<_i344.ActionBloc>(
        () => _i344.ActionBloc(router: gh<_i1052.AppRouter>()));
    gh.singleton<_i811.NotificationBloc>(
        () => _i811.NotificationBloc(router: gh<_i1052.AppRouter>()));
    gh.singleton<_i651.AlertManager>(
        () => _i651.AlertManager(router: gh<_i1052.AppRouter>()));
    gh.singleton<_i115.DeviceDataSource>(() =>
        _i115.DeviceDataSource(networkManager: gh<_i425.NetworkManager>()));
    gh.singleton<_i161.UserDataSource>(
        () => _i161.UserDataSource(networkManager: gh<_i425.NetworkManager>()));
    gh.singleton<_i615.PermissionService>(() => _i615.PermissionService(
          router: gh<_i1052.AppRouter>(),
          alertManager: gh<_i651.AlertManager>(),
        ));
    gh.singleton<_i2.UserRepository>(() => _i556.DefaultUserRepository(
          userDataSource: gh<_i161.UserDataSource>(),
          userLocalDataSource: gh<_i768.UserLocalDataSource>(),
          deviceDataSource: gh<_i115.DeviceDataSource>(),
        ));
    gh.singleton<_i539.ImageService>(() => _i539.ImageService(
          router: gh<_i1052.AppRouter>(),
          permissionService: gh<_i615.PermissionService>(),
        ));
    gh.singleton<_i974.SuggestionsBloc>(() => _i974.SuggestionsBloc(
          userRepository: gh<_i2.UserRepository>(),
          alertManager: gh<_i651.AlertManager>(),
        ));
    gh.singleton<_i982.AuthBloc>(() => _i982.AuthBloc(
          router: gh<_i1052.AppRouter>(),
          userRepository: gh<_i2.UserRepository>(),
        ));
    gh.singleton<_i441.ProfileBloc>(() => _i441.ProfileBloc(
          router: gh<_i1052.AppRouter>(),
          userRepository: gh<_i2.UserRepository>(),
          authBloc: gh<_i982.AuthBloc>(),
        ));
    gh.singleton<_i310.DiscoverBloc>(() => _i310.DiscoverBloc(
          router: gh<_i1052.AppRouter>(),
          authBloc: gh<_i982.AuthBloc>(),
          alertManager: gh<_i651.AlertManager>(),
          userRepository: gh<_i2.UserRepository>(),
          actionBloc: gh<_i344.ActionBloc>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i911.RegisterModule {}
