import 'package:flutter/material.dart';
import 'package:stocks/core/helpers/extensions/context_extensions.dart';

import '../../networking/custom_exception.dart' show CustomException;
import 'custom_error_widget.dart';

class ErrorResponseHandler extends StatelessWidget {
  final Object error;
  final StackTrace? stackTrace;
  final VoidCallback? onError;
  final VoidCallback? retryCallback;

  const ErrorResponseHandler({
    super.key,
    this.onError,
    required this.retryCallback,
    required this.error,
    required this.stackTrace,
  });

  const factory ErrorResponseHandler.builder({
    Key? key,
    VoidCallback? onError,
    required Object error,
    required StackTrace? stackTrace,
    required Widget Function(CustomException) builder,
  }) = _ErrorResponseHandlerWithBuilder;

  @override
  Widget build(BuildContext context) {
    if (error is CustomException) {
      return CustomErrorWidget.light(
        error: error as CustomException,
        retryCallback: retryCallback!,
        height: context.screenHeight * 0.5,
      );
    }
    onError?.call();
    debugPrint(error.toString());
    debugPrint(stackTrace?.toString());
    return const SizedBox.shrink();
  }
}

class _ErrorResponseHandlerWithBuilder extends ErrorResponseHandler {
  final Widget Function(CustomException) builder;

  const _ErrorResponseHandlerWithBuilder({
    super.key,
    super.onError,
    required super.error,
    required super.stackTrace,
    required this.builder,
  }) : super(retryCallback: null);

  @override
  Widget build(BuildContext context) {
    if (error is CustomException) return builder(error as CustomException);
    onError?.call();
    debugPrint(error.toString());
    debugPrint(stackTrace?.toString());
    return Text(error.toString());
  }
}
