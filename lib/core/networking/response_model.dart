import '../shared/type_defs.dart' show JSON;
import '../shared/utils.dart' show AppUtils;

class ResponseModel<T> {
  final ResponseHeadersModel headers;
  final T body;

  const ResponseModel({required this.headers, required this.body});

  factory ResponseModel.fromJson(JSON json) {
    return ResponseModel(
      headers: ResponseHeadersModel.fromJson(
        (json['headers'] != null)
            ? json['headers'] as JSON
            : {
              "headers": {"message": "success", "code": 200, "error": 0},
            },
      ),
      body: (json['body'] != null) ? json['body'] as T : json as T,
    );
  }

  factory ResponseModel.fromList(List<dynamic> list) {
    return ResponseModel(
      headers: ResponseHeadersModel(
        error: false,
        message: 'Success',
        code: 200,
      ),
      body: list as T,
    );
  }
}

class ResponseHeadersModel {
  final bool error;
  final String message;
  final int code;

  const ResponseHeadersModel({
    required this.error,
    required this.message,
    required this.code,
  });

  factory ResponseHeadersModel.fromJson(JSON json) {
    return ResponseHeadersModel(
      error: AppUtils.boolFromInt(json['error'] as int),
      message: json['message'] as String,
      code: json['code'],
    );
  }
}
