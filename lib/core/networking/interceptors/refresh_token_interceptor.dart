// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../shared/type_defs.dart' show JSON;
import '../api_endpoint.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;
  RefreshTokenInterceptor({required Dio dioClient}) : dio = dioClient;
  String get TokenExpiredException => 'TokenExpiredException';

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      if (err.response!.data != null) {}
    }

    return super.onError(err, handler);
  }

  Future<String?> refreshTokenRequest({
    required DioError dioError,
    required ErrorInterceptorHandler handler,
    required Dio tokenDio,
    required JSON data,
  }) async {
    debugPrint('--> REFRESHING TOKEN');
    try {
      debugPrint('\tBody: $data');

      final response = await tokenDio.post<JSON>(
        ApiEndpoint.auth(AuthEndpoint.REFRESH_TOKEN),
        data: data,
      );

      debugPrint('\tStatus code:${response.statusCode}');
      debugPrint('\tResponse: ${response.data}');
      final success = response.data?['headers']['error'] == 0;

      if (success) {
        debugPrint('<-- END REFRESH');
        return response.data?['body']['token'] as String;
      } else {
        throw Exception(response.data?['headers']['message']);
      }
    } on Exception catch (ex) {
      debugPrint('\t--> ERROR');
      if (ex is DioError) {
        final de = ex;
        debugPrint('\t\t--> Exception: ${de.error}');
        debugPrint('\t\t--> Message: ${de.message}');
        debugPrint('\t\t--> Response: ${de.response}');
      } else {
        debugPrint('\t\t--> Exception: $ex');
      }
      debugPrint('\t<-- END ERROR');
      debugPrint('<-- END REFRESH');

      return null;
    } finally {}
  }
}
