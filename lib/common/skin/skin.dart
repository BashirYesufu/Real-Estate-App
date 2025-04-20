import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

class SkinData {
  static ThemeData lightSkin = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    cardColor: AppColors.white,
    fontFamily: AppFonts.euclid,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.primaryContainer,
      secondary: AppColors.secondary,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondary: AppColors.darkGrey,
      tertiary: AppColors.tertiary,
      error: AppColors.error,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.darkGrey,
    ),
    textTheme: _lightTextTheme(ThemeData.light().textTheme),
  );
}

// -------- TEXT THEME (LIGHT) ---------------------
TextTheme _lightTextTheme(TextTheme textTheme) {
  return textTheme.copyWith(
    bodySmall: textTheme.bodySmall?.copyWith(
      fontFamily: AppFonts.euclid,
      fontSize: 13,
      color: AppColors.secondary,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: textTheme.bodyMedium?.copyWith(
      fontFamily: AppFonts.euclid,
      fontSize: 15,
      color: AppColors.secondary,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: textTheme.bodyLarge?.copyWith(
      fontFamily: AppFonts.euclid,
      fontSize: 20,
      color: AppColors.secondary,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: textTheme.titleLarge?.copyWith(
      fontFamily: AppFonts.euclid,
      fontSize: 28,
      color: AppColors.darkGrey,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: textTheme.labelLarge?.copyWith(
      fontFamily: AppFonts.euclid,
      fontSize: 30,
      color: AppColors.secondary,
      fontWeight: FontWeight.w600,
    ),
  );
}