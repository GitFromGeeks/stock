import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../helpers/constants/app_colors.dart' show AppColors;
import '../../helpers/constants/app_styles.dart' show Insets;
import '../../helpers/constants/lottie_assets.dart' show LottieAssets;

class EmptyStateWidget extends StatelessWidget {
  final double height, width;
  final Widget? animation;
  final String? subtitle;
  final String? title;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget? button;

  const EmptyStateWidget({
    super.key,
    this.animation,
    this.subtitle,
    this.title,
    this.button,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        height: height,
        width: width,
        child: FittedBox(
          child: Column(
            // spacing: 10,
            children: [
              animation ??
                  Lottie.asset(
                    LottieAssets.emptySearchLottie,
                    width: 250,
                    height: 250,
                  ),

              // Info
              Padding(
                padding: padding,
                child: Column(
                  spacing: 5,
                  children: [
                    // Title
                    Text(
                      title ?? 'No results found.',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Insets.gapH5,

                    // Subtitle
                    Text(
                      subtitle ?? 'Check again at a later time',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textGreyColor,
                      ),
                    ),
                    if (button != null) button!,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
