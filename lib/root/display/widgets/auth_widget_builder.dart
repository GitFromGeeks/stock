import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter/widgets.dart' show Widget;
import 'package:hooks_riverpod/hooks_riverpod.dart'
    show AsyncValueX, HookConsumerWidget, WidgetRef;

import '../../../features/auth/display/providers/auth_provider.dart'
    show authProvider;
import '../pages/skeleton_page.dart' show SkeletonPage;
import '../pages/welcome_page.dart' show WelcomePage;

class AuthWidgetBuilder extends HookConsumerWidget {
  const AuthWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    return authState.maybeWhen(
      data:
          (data) =>
              (data != null && data) ? const SkeletonPage() : WelcomePage(),
      orElse: () => const WelcomePage(),
    );
  }
}
