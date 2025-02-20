import 'package:hooks_riverpod/hooks_riverpod.dart' show Provider;

import '../../../core/networking/api_endpoint.dart'
    show ApiEndpoint, AuthEndpoint;
import '../../../core/networking/api_provider.dart' show apiServiceProvider;
import '../../../core/networking/api_service.dart' show ApiService;
import '../../../core/networking/custom_exception.dart' show CustomException;
import '../../../core/networking/response_model.dart' show ResponseModel;
import '../../../core/shared/type_defs.dart' show JSON;

final authRemoteSourceProvider = Provider<AuthRemoteSource>((ref) {
  var apiService = ref.watch(apiServiceProvider);
  return AuthRemoteSourceImpl(remote: apiService);
});

abstract class AuthRemoteSource {
  Future<ResponseModel<bool?>?> login({
    JSON? params,
    required void Function(String newToken) updateTokenCallback,
  });
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  final ApiService remote;
  AuthRemoteSourceImpl({required this.remote});

  @override
  Future<ResponseModel<bool?>?> login({
    JSON? params,
    required void Function(String newToken) updateTokenCallback,
  }) async {
    ResponseModel<bool?>? response;
    try {
      await remote.setData(
        requiresAuthToken: false,
        endpoint: ApiEndpoint.auth(AuthEndpoint.LOGIN),
        data: params!,
        converter: (resp) {
          updateTokenCallback(resp.body["jwt"]);
          if (resp.body["jwt"] != null) {
            response = ResponseModel(headers: resp.headers, body: true);
          } else {
            response = ResponseModel(headers: resp.headers, body: false);
          }
        },
      );
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }
    return response;
  }
}
