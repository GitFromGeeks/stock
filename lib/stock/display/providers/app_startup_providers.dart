import 'package:hooks_riverpod/hooks_riverpod.dart' show FutureProvider;

import '../../../auth/display/providers/auth_provider.dart' show authProvider;

final cacheLoaderFutureProvider = FutureProvider.autoDispose<bool>((ref) async {
  final authNotifier = ref.watch(authProvider.notifier);
  return await authNotifier.loadAuthUserDataInMemory();
});
