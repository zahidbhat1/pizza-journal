import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pizzajournals/data/source/network/api_config.dart';
import 'package:pizzajournals/data/source/network/interceptors/authorization_interceptor.dart';
import 'package:pizzajournals/data/source/network/interceptors/content_type_interceptor.dart';
import 'package:pizzajournals/data/source/network/interceptors/logging_interceptor.dart';
import 'package:pizzajournals/data/states/action/action_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_bloc.dart';
import 'package:pizzajournals/data/states/discover/discover_bloc.dart';
import 'package:pizzajournals/data/states/notification/notification_bloc.dart';
import 'package:pizzajournals/data/states/profile/profile_bloc.dart';
import 'package:pizzajournals/data/states/settings/settings_bloc.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';

import 'data/states/suggestion/suggestions_bloc.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
FutureOr<void> configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @singleton
  Dio get dio =>
      Dio(
        BaseOptions(
          baseUrl: "https://pizzajournals.com/",
          connectTimeout: ApiConfig.connectTimeout,
          receiveTimeout: ApiConfig.receiveTimeout,
        ),
      )
        ..interceptors.addAll(
          [
            ContentTypeInterceptor(),
            AuthorizationInterceptor(storage: storage),
            if (kDebugMode) LoggingInterceptor(),
          ],
        );

  FlutterSecureStorage get storage => const FlutterSecureStorage();

  @singleton
  AppRouter get router => AppRouter();
}

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;

  const GlobalBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt.get<AuthBloc>(),
        ),
        BlocProvider<ActionBloc>(
          create: (context) => getIt.get<ActionBloc>(),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => getIt.get<SettingsBloc>(),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => getIt.get<NotificationBloc>(),
        ),
        BlocProvider<DiscoverBloc>(
          create: (context) => getIt.get<DiscoverBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => getIt.get<ProfileBloc>(),
        ),
        BlocProvider<SuggestionsBloc>(
          create: (context) => getIt.get<SuggestionsBloc>(),
        ),
      ],
      child: child,
    );
  }
}
