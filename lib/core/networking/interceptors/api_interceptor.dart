import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/all_providers.dart' show keyValueStorageServiceProvider;

class ApiInterceptor extends Interceptor {
  late final Ref _ref;

  ApiInterceptor(this._ref) : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra.containsKey('requiresAuthToken')) {
      if (options.extra['requiresAuthToken'] == true) {
        final token =
            await _ref.watch(keyValueStorageServiceProvider).getAuthToken();
        options.headers.addAll(<String, Object?>{
          'Authorization': 'Bearer $token',
        });
      }

      options.extra.remove('requiresAuthToken');
    }
    return handler.next(options);
  }
}
