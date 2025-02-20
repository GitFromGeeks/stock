import 'package:flutter/material.dart';

@immutable
class AppColors {
  const AppColors._();

  static const List<Color> primaries = [
    Color.fromARGB(249, 195, 91, 255),
    Color.fromARGB(255, 202, 108, 0),
    Color.fromARGB(255, 255, 39, 39),
    Color.fromARGB(255, 255, 132, 17),
    Color.fromARGB(255, 255, 180, 180),
    Color.fromARGB(255, 43, 206, 255),
    Color.fromARGB(255, 194, 255, 27),
    Color.fromARGB(255, 0, 248, 0),
    Colors.tealAccent,
    Color.fromARGB(255, 255, 70, 132),
    secondaryColor,
    Color.fromARGB(255, 0, 150, 236),
  ];

  static const Color primaryColor = Color.fromARGB(255, 135, 0, 224);
  static const Color lightPrimaryColor = Color.fromARGB(248, 222, 175, 250);
  static const Color secondaryColor = Color.fromARGB(255, 237, 177, 11);
  static const Color success = Color.fromARGB(255, 12, 142, 5);

  static const Color tertiaryColor = Color.fromARGB(255, 43, 43, 43);
  static const Color lightBackgroundColor = Color.fromARGB(255, 253, 253, 253);
  static const Color backgroundColor = Color.fromARGB(255, 240, 240, 240);
  static const Color surfaceColor = Color.fromARGB(255, 253, 253, 253);
  static const Color fieldFillColor = Color.fromARGB(255, 235, 235, 235);
  static const Color redColor = Color(0xFFed0000);
  static const Color starsColor = Color.fromARGB(255, 247, 162, 64);
  static const Color darkSkeletonColor = Color(0xFF656565);
  static const Color lightSkeletonColor = Colors.grey;
  static const Color white = Color.fromARGB(255, 255, 255, 255);

  static const Color greyOutlineColor = Color.fromARGB(255, 207, 207, 207);
  static const Color lightOutlineColor = Color.fromARGB(255, 224, 224, 224);
  static const Color lightRed = Color.fromARGB(255, 246, 151, 151);
  static const Color black = Color.fromARGB(255, 0, 0, 0);

  static const Gradient buttonGradientRed = LinearGradient(
    colors: [Color.fromARGB(255, 242, 57, 57), redColor],
  );

  static const Gradient buttonGradientPurple = LinearGradient(
    colors: [lightPrimaryColor, primaryColor],
  );

  static const Gradient buttonGradientGrey = LinearGradient(
    colors: [lightSkeletonColor, darkSkeletonColor],
  );

  static const Gradient movieCarouselGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.3, 0.6, 1],
    colors: [
      Color.fromRGBO(255, 255, 255, 0.95),
      Colors.white70,
      Colors.transparent,
    ],
  );

  static const Gradient blackOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.2, 0.5, 0.7, 1],
    colors: [
      Color.fromRGBO(0, 0, 0, 0.6),
      Color.fromRGBO(0, 0, 0, 0.45),
      Color.fromRGBO(0, 0, 0, 0.3),
      Colors.transparent,
    ],
  );

  static const Color buttonGreyColor = Color(0xFF1c1c1c);
  static const Color scaffoldGreyColor = Color(0xFF2b2b2b);
  static const Color textGreyColor = Color.fromARGB(255, 122, 122, 122);
  static const Color textLightGreyColor = Color.fromARGB(255, 171, 180, 185);
  static const Color textBlackColor = Color.fromARGB(255, 43, 43, 43);
  static const Color textWhite80Color = Color(0xFFf2f2f2);
  static const Color barrierColor = Colors.black87;
  static const Color barrierColorLight = Color(0xBF000000);
}
