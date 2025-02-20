// ignore_for_file: unnecessary_this

import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String toDateString([String format = 'd MMM, y - hh:mm a']) {
    return DateFormat(format).format(this);
  }
}
