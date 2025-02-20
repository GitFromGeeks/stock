import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' show Lottie;
import 'package:stocks/core/helpers/extensions/context_extensions.dart';

import '../../helpers/constants/app_utils.dart' show AppUtils;
import '../../helpers/constants/lottie_assets.dart' show LottieAssets;

class LottieAnimationLoader extends StatelessWidget {
  const LottieAnimationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    const loaders = [
      LottieAssets.movingBusLottie,
      LottieAssets.peopleTalkingLottie,
    ];
    final i = AppUtils.randomizer().nextInt(2);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: context.screenWidth * 0.6,
          child: Lottie.asset(loaders[i], width: context.screenWidth),
        ),
      ),
    );
  }
}
