import 'package:flutter/material.dart';

@immutable
class IconSizes {
  const IconSizes._();

  static const double sm19 = 19;
  static const double med22 = 22;
  static const double lg27 = 27;
}

@immutable
class Insets {
  const Insets._();

  static const gapH3 = SizedBox(height: 3);
  static const gapW3 = SizedBox(width: 3);
  static const gapH5 = SizedBox(height: 5);
  static const gapW5 = SizedBox(width: 5);
  static const gapH10 = SizedBox(height: 10);
  static const gapW10 = SizedBox(width: 10);
  static const gapH15 = SizedBox(height: 15);
  static const gapW15 = SizedBox(width: 15);
  static const gapH20 = SizedBox(height: 20);
  static const gapW20 = SizedBox(width: 20);
  static const gapH25 = SizedBox(height: 25);
  static const gapW25 = SizedBox(width: 25);
  static const gapH30 = SizedBox(height: 30);
  static const gapW30 = SizedBox(width: 30);
  static const expand = Spacer();

  static const bottomInsets = SizedBox(height: 38);

  static const bottomInsetsLow = SizedBox(height: 20);
}

@immutable
class Corners {
  const Corners._();

  static const BorderRadius rounded4 = BorderRadius.all(Radius.circular(4));
  static const BorderRadius rounded7 = BorderRadius.all(Radius.circular(7));
  static const BorderRadius rounded9 = BorderRadius.all(Radius.circular(9));
  static const BorderRadius rounded10 = BorderRadius.all(Radius.circular(10));
  static const BorderRadius rounded15 = BorderRadius.all(Radius.circular(15));
  static const BorderRadius rounded20 = BorderRadius.all(Radius.circular(20));
  static const BorderRadius rounded50 = BorderRadius.all(Radius.circular(50));
}

@immutable
class Shadows {
  const Shadows._();

  static const List<BoxShadow> universal = [
    BoxShadow(
      color: Color.fromRGBO(51, 51, 51, 0.15),
      blurRadius: 10,
    ),
  ];

  static const elevated = <BoxShadow>[
    BoxShadow(
      color: Color.fromARGB(76, 158, 158, 158),
      blurRadius: 3,
      spreadRadius: -0.2,
      offset: Offset(2, 0),
    ),
    BoxShadow(
      color: Color.fromARGB(76, 158, 158, 158),
      blurRadius: 3,
      spreadRadius: -0.2,
      offset: Offset(-2, 0),
    ),
  ];

  static const List<BoxShadow> small = [
    BoxShadow(
      color: Color.fromRGBO(51, 51, 51, .15),
      blurRadius: 3,
      offset: Offset(0, 1),
    ),
  ];
}
