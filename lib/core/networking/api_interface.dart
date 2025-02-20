import 'package:dio/dio.dart';
import 'package:stocks/core/shared/type_defs.dart' show JSON;

import 'response_model.dart';

abstract class ApiInterface {
  const ApiInterface();

  Future<ResponseModel<List<T>>> getCollectionData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON responseBody) converter,
  });

  Future<ResponseModel<T>> getDocumentData<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(JSON responseBody) converter,
  });

  Future<T> setData<T>({
    required String endpoint,
    required JSON data,
    CancelToken? cancelToken,
    bool requiresAuthToken = true,
    required T Function(ResponseModel<JSON> response) converter,
  });

  void cancelRequests({CancelToken? cancelToken});
}
