import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;

import '../../../../core/networking/api_endpoint.dart'
    show ApiEndpoint, AuthEndpoint;
import '../../../../core/networking/api_provider.dart' show apiServiceProvider;
import '../../../../core/networking/api_service.dart' show ApiService;
import '../../../../core/networking/custom_exception.dart' show CustomException;
import '../../../../core/networking/response_model.dart' show ResponseModel;
import '../../../../core/shared/type_defs.dart' show JSON;

final authRemoteSourceProvider = Provider<AuthRemoteSource>((ref) {
  var apiService = ref.watch(apiServiceProvider);
  return AuthRemoteSourceImpl(remote: apiService);
});

abstract class AuthRemoteSource {
  Future<ResponseModel<bool?>?> login({JSON? params});
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  final ApiService remote;
  AuthRemoteSourceImpl({required this.remote});

  @override
  Future<ResponseModel<bool?>?> login({JSON? params}) async {
    ResponseModel<bool?>? response;
    try {
      await remote.setData(
        endpoint: ApiEndpoint.auth(AuthEndpoint.LOGIN),
        data: params!,
        converter: (resp) {
          log("Login Response : ${resp.body}");
        },
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }
    return response;
  }
}
