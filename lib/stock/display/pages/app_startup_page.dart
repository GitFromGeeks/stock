import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show AsyncValueX, ConsumerWidget, WidgetRef;

import '../../../core/shared/widgets/error_response_handler.dart'
    show ErrorResponseHandler;
import '../../../core/shared/widgets/loaders.dart' show LottieAnimationLoader;
import '../providers/app_startup_providers.dart' show cacheLoaderFutureProvider;
import '../widgets/auth_widget_builder.dart' show AuthWidgetBuilder;

class AppStartupPage extends ConsumerWidget {
  const AppStartupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheLoaderFuture = ref.watch(cacheLoaderFutureProvider);
    return cacheLoaderFuture.when(
      data: (_) => AuthWidgetBuilder(),
      loading: () => const LottieAnimationLoader(),
      error:
          (error, st) => Scaffold(
            body: ErrorResponseHandler(
              error: error,
              retryCallback: () async => ref.refresh(cacheLoaderFutureProvider),
              stackTrace: st,
            ),
          ),
    );
  }
}
