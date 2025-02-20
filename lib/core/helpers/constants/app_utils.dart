import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:stocks/core/helpers/extensions/datetime_extension.dart';

import 'app_colors.dart';

@immutable
class AppUtils {
  const AppUtils._();

  static Random randomizer([int? seed]) => Random(seed);
  static Color getRandomColor([int? seed, List<Color>? colors]) {
    final rInt = seed != null ? (seed + DateTime.now().minute) : null;
    final colors0 = colors ?? AppColors.primaries;
    return colors0[randomizer(rInt).nextInt(colors0.length)];
  }

  static bool boolFromInt(int i) => i == 1;

  static int boolToInt(bool b) => b ? 1 : 0;

  static String dateToJson(DateTime date) {
    return date.toDateString('yyyy-MM-dd');
  }

  static String dateTimeToJson(DateTime date) {
    return date.toDateString('yyyy-MM-dd HH:mm:ss');
  }

  static TimeOfDay timeFromJson(String time) {
    final dateTime = DateFormat.Hms().parse(time);
    return TimeOfDay.fromDateTime(dateTime);
  }

  static T? toNull<T>(Object? _) => null;

  static List<int>? removeNulls(List? list) {
    return list?.whereType<int>().toList();
  }
}

@immutable
class Regexes {
  const Regexes._();
  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\.]+\.(com|pk)+",
  );
  static RegExp contactRegex = RegExp(r'^\d{10}$');
  static RegExp erpRegex = RegExp(r'^[1-9]{1}\d{4}$');
  static RegExp nameRegex = RegExp(r'^[a-z A-Z]+$');
  static RegExp zipCodeRegex = RegExp(r'^\d{5}$');
  static RegExp creditCardNumberRegex = RegExp(
    r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$',
  );
  static RegExp creditCardCVVRegex = RegExp(r'^[0-9]{3}$');
  static RegExp creditCardExpiryRegex = RegExp(
    r'(0[1-9]|10|11|12)/20[0-9]{2}$',
  );
  static final RegExp otpDigitRegex = RegExp(r'^[0-9]{1}$');
}

@immutable
class AppDurations {
  const AppDurations._();

  static const fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const normal = Duration(milliseconds: 300);
  static const medium = Duration(milliseconds: 500);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}
