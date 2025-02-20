import '../constants/app_utils.dart' show Regexes;

extension StringExt on String {
  bool get isValidEmail => Regexes.emailRegex.hasMatch(this);
}
