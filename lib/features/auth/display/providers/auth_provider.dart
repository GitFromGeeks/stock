import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stocks/core/networking/response_model.dart';
import 'package:stocks/features/auth/data/dataSource/auth_remote_source.dart';

import '../../../../core/config/routes/app_router.dart';
import '../../../../core/config/routes/routes.dart' show RouteAnimation, Routes;
import '../../../../core/helpers/constants/app_utils.dart' show AppDurations;
import '../../../../core/providers/all_providers.dart'
    show keyValueStorageServiceProvider;
import '../../../../core/storage/key_value_storage_service.dart'
    show KeyValueStorageService;

final authProvider = StateNotifierProvider<AuthProvider, AsyncValue<bool?>>(
  (ref) => AuthProvider(
    ref,
    keyValueStorageService: ref.watch(keyValueStorageServiceProvider),
  ),
);

class AuthProvider extends StateNotifier<AsyncValue<bool?>> {
  final KeyValueStorageService keyValueStorageService;
  final Ref ref;

  AuthProvider(this.ref, {required this.keyValueStorageService})
    : super(AsyncValue.data(null));

  void cacheAuthToken(String value) {
    keyValueStorageService.setAuthToken(value);
  }

  void logout() {
    keyValueStorageService.resetKeys();
    state = AsyncData(false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final navigator = AppRouter.navigatorKey.currentState;
      if (navigator == null) return;
      if (navigator.canPop()) {
        navigator.pushNamedAndRemoveUntil(
          Routes.AppStartupScreenRoute,
          (route) => false,
          arguments: {"from": RouteAnimation.fromLeft},
        );
      } else {
        navigator.pushReplacementNamed(
          Routes.AppStartupScreenRoute,
          arguments: {"from": RouteAnimation.fromLeft},
        );
      }
    });
  }

  Future<bool> loadAuthUserDataInMemory() async {
    await Future.delayed(AppDurations.slower);
    var jwtToken = await keyValueStorageService.getAuthToken();
    bool isAuthenticated = jwtToken != null;
    state = AsyncData(isAuthenticated);
    return isAuthenticated;
  }

  Future<ResponseModel<String?>?> login({
    required String email,
    required String password,
  }) async {
    var remote = ref.watch(authRemoteSourceProvider);
    try {
      var response = await remote.login(
        params: {"identifier": email, "password": password},
      );
      log("Login Response at Provider : ${response?.body}");
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
