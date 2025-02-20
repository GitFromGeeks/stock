import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../shared/type_defs.dart' show JSON;
import 'api_interface.dart';
import 'custom_exception.dart';
import 'dio_service.dart';
import 'response_model.dart';

class ApiService implements ApiInterface {
  late final DioService _dioService;
  ApiService(DioService dioService) : _dioService = dioService;

  @override
  Future<ResponseModel<List<T>>> getCollectionData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    bool requiresAuthToken = true,
    bool withIsolates = false,
    required T Function(JSON responseBody) converter,
  }) async {
    List<Object?> body;

    ResponseHeadersModel header;
    try {
      final data = await _dioService.get<List<Object?>>(
        endpoint: endpoint,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale:
              cacheAgeDays != null
                  ? Nullable(Duration(days: cacheAgeDays))
                  : null,
        ),
        options: Options(
          extra: <String, Object?>{'requiresAuthToken': requiresAuthToken},
        ),
        queryParams: queryParams,
        cancelToken: cancelToken,
      );
      body = data.body;
      header = data.headers;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      List<T> responseBody;
      responseBody =
          body.map((dataMap) => converter(dataMap! as JSON)).toList();
      return ResponseModel(headers: header, body: responseBody);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<ResponseModel<T>> getDocumentData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    CachePolicy? cachePolicy,
    int? cacheAgeDays,
    bool requiresAuthToken = true,
    bool withIsolates = false,
    required T Function(JSON response) converter,
  }) async {
    JSON body;
    ResponseHeadersModel header;

    try {
      final data = await _dioService.get<JSON>(
        endpoint: endpoint,
        queryParams: queryParams,
        cacheOptions: _dioService.globalCacheOptions?.copyWith(
          policy: cachePolicy,
          maxStale:
              cacheAgeDays != null
                  ? Nullable(Duration(days: cacheAgeDays))
                  : null,
        ),
        options: Options(
          extra: <String, Object?>{'requiresAuthToken': requiresAuthToken},
        ),
        cancelToken: cancelToken,
      );

      body = data.body;
      header = data.headers;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      T responseBody;
      responseBody = converter(body);
      return ResponseModel(headers: header, body: responseBody);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(ResponseModel<JSON> response) converter,
  }) async {
    ResponseModel<JSON> response;

    try {
      response = await _dioService.post<JSON>(
        endpoint: endpoint,
        data: data,
        options: Options(
          extra: <String, Object?>{'requiresAuthToken': requiresAuthToken},
        ),
        cancelToken: cancelToken,
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }

    try {
      return converter(response);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }

  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }
}
