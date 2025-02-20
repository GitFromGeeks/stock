import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stocks/core/networking/api_endpoint.dart' show ApiEndpoint;
import 'package:stocks/core/networking/api_service.dart' show ApiService;

import '../storage/path_provider_service.dart' show PathProviderService;
import 'dio_service.dart' show DioService;
import 'interceptors/api_interceptor.dart' show ApiInterceptor;
import 'interceptors/logging_interceptor.dart' show LoggingInterceptor;

final _dioProvider = Provider<Dio>((ref) {
  final baseOptions = BaseOptions(
    baseUrl: ApiEndpoint.baseUrl,
    headers: {"Accept": "application/json", "content-type": "application/json"},
  );
  return Dio(baseOptions);
});

final _dioServiceProvider = Provider<DioService>((ref) {
  final dio = ref.watch(_dioProvider);
  final cacheOptions = CacheOptions(
    store: HiveCacheStore(PathProviderService.path),
    policy: CachePolicy.noCache,
    maxStale: const Duration(days: 30),
    keyBuilder: (options) => options.path,
  );
  return DioService(
    dioClient: dio,
    globalCacheOptions: cacheOptions,
    interceptors: [
      ApiInterceptor(ref),
      DioCacheInterceptor(options: cacheOptions),
      if (kDebugMode) LoggingInterceptor(),
    ],
  );
});

final apiServiceProvider = Provider<ApiService>((ref) {
  final dioService = ref.watch(_dioServiceProvider);
  return ApiService(dioService);
});
