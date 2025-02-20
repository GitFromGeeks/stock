import 'package:hooks_riverpod/hooks_riverpod.dart' show FutureProvider;

import '../../../features/auth/display/providers/auth_provider.dart'
    show authProvider;

final cacheLoaderFutureProvider = FutureProvider.autoDispose<bool>((ref) async {
  final authNotifier = ref.watch(authProvider.notifier);
  try {
    final result = await authNotifier.loadAuthUserDataInMemory();
    return result;
  } catch (e, _) {
    return false;
  }
});
