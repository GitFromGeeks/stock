import 'package:flutter/material.dart';

// Helpers
import 'app_colors.dart';
import 'app_typography.dart';

@immutable
class AppThemes {
  const AppThemes._();

  static final mainTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      onPrimary: AppColors.textWhite80Color,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.textBlackColor,
      tertiary: AppColors.tertiaryColor,
      onTertiary: AppColors.textGreyColor,
      surface: AppColors.surfaceColor,
      onSurface: AppColors.textBlackColor,
      error: AppColors.redColor,
      onError: AppColors.textWhite80Color,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: AppTypography.primary.fontFamily,
    textTheme: AppTypography.primary.textTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.greyOutlineColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.greyOutlineColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.primaryColor)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.redColor)),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.backgroundColor,
      titleTextStyle: AppTypography.primary.heading22,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.backgroundColor,
      selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
      unselectedIconTheme: IconThemeData(color: AppColors.lightSkeletonColor),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.lightSkeletonColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.textLightGreyColor),
  );
}
