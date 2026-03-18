import 'package:flutter/material.dart';

import '../colors/colors.dart';

// ignore: constant_identifier_names
const FONT_FAMILY = 'Poppins';

mixin AppTypography {
  // LIGHT THEME TEXT
  static TextTheme lightTextTheme = TextTheme(
    labelLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0.1,
      color: AppColors.black,
      fontFamily: FONT_FAMILY,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.5,
      color: AppColors.black,
      fontFamily: FONT_FAMILY,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      letterSpacing: 0.5,
      color: AppColors.black,
      fontFamily: FONT_FAMILY,
    ),
    bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w400,
        fontFamily: FONT_FAMILY),
    bodyMedium: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w400,
        fontFamily: FONT_FAMILY),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0.4,
      fontFamily: FONT_FAMILY,
      color: AppColors.black,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      letterSpacing: 0,
      fontFamily: FONT_FAMILY,
      color: AppColors.black,
    ),
    titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: 0.15,
        fontFamily: FONT_FAMILY,
        color: AppColors.black),
    titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 0.1,
        fontFamily: FONT_FAMILY,
        color: AppColors.black),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 32,
      letterSpacing: 0,
      fontFamily: FONT_FAMILY,
      color: AppColors.black,
    ),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 28,
        letterSpacing: 0,
        fontFamily: FONT_FAMILY,
        color: AppColors.black),
    headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        letterSpacing: 0,
        fontFamily: FONT_FAMILY,
        color: AppColors.black),
  );

  // DARK THEME TEXT
  static TextTheme darkTextTheme = const TextTheme(
    labelLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0.1,
      color: AppColors.white,
      fontFamily: FONT_FAMILY,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.5,
      color: AppColors.white,
      fontFamily: FONT_FAMILY,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      letterSpacing: 0.5,
      color: AppColors.white,
      fontFamily: FONT_FAMILY,
    ),
    bodyLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w400,
        fontFamily: FONT_FAMILY),
    bodyMedium: TextStyle(
        color: AppColors.white,
        fontSize: 14,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w400,
        fontFamily: FONT_FAMILY),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0.4,
      fontFamily: FONT_FAMILY,
      color: AppColors.white,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 22,
      letterSpacing: 0,
      fontFamily: FONT_FAMILY,
      color: AppColors.white,
    ),
    titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        letterSpacing: 0.15,
        fontFamily: FONT_FAMILY,
        color: AppColors.white),
    titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 0.1,
        fontFamily: FONT_FAMILY,
        color: AppColors.white),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 32,
      letterSpacing: 0,
      fontFamily: FONT_FAMILY,
      color: AppColors.white,
    ),
    headlineMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 28,
        letterSpacing: 0,
        fontFamily: FONT_FAMILY,
        color: AppColors.white),
    headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        letterSpacing: 0,
        fontFamily: FONT_FAMILY,
        color: AppColors.white),
  );
}
