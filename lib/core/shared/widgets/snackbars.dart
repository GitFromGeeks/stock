import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../helpers/constants/app_colors.dart' show AppColors;

showErrorSnackbar(context, String title) async => ScaffoldMessenger.of(
  context,
).showSnackBar(
  SnackBar(
    behavior: SnackBarBehavior.floating,

    backgroundColor: const Color.fromARGB(255, 144, 44, 37),
    content: Text(
      title,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  ),
);

showInformalSnackbar(context, String title) async => ScaffoldMessenger.of(
  context,
).showSnackBar(
  SnackBar(
    duration: Duration(seconds: 1),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color.fromARGB(255, 152, 150, 9),
    content: Text(
      title,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  ),
);

showSuccessSnackbar(context, String title) async =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.success,
        content: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ), // Customize the text style
        ),
      ),
    );

showErrorToast(BuildContext context, String title) async =>
    Fluttertoast.showToast(
      msg: title,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );

showSuccessToast(BuildContext context, String title) async =>
    Fluttertoast.showToast(
      msg: title,
      backgroundColor: AppColors.success,
      textColor: Colors.white,
    );

showInformalToast(BuildContext context, String title) async =>
    Fluttertoast.showToast(
      msg: title,
      backgroundColor: const Color.fromARGB(255, 220, 167, 9),
      textColor: Colors.white,
    );

showGreyToast(BuildContext context, String title) async =>
    Fluttertoast.showToast(
      msg: title,
      backgroundColor: const Color.fromARGB(255, 100, 100, 98),
      textColor: Colors.white,
    );
