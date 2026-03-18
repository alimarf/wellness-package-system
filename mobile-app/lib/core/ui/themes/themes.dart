import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../colors/colors.dart';
import '../typography/typography.dart';

mixin AppThemes {
  // —————————————————————————————————————————————————————————————————————————————
  // light
  // —————————————————————————————————————————————————————————————————————————————
  static final light = ThemeData(
    // Coloring
    primaryColor: AppColors.secondary.shade700,
    primaryColorDark: AppColors.secondary.shade700,
    primaryColorLight: AppColors.secondary.shade700,
    primaryIconTheme: IconThemeData(color: AppColors.secondary.shade700),
    colorScheme: ColorScheme.light(primary: AppColors.primary)
        .copyWith(secondary: AppColors.primary),
    scaffoldBackgroundColor: AppColors.white,
    dividerColor: Colors.black12,
    unselectedWidgetColor: AppColors.black,

    // ListTile
    listTileTheme: const ListTileThemeData(
      textColor: Colors.black,
      minLeadingWidth: 16,
      contentPadding: EdgeInsets.all(0),
    ),

    // FAB
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary.shade700,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.secondary.shade700,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    // AppBar
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 1.0,
      titleTextStyle: AppTypography.lightTextTheme.titleMedium
          ?.copyWith(fontWeight: FontWeight.w400),
      toolbarTextStyle: const TextStyle(color: Colors.black),
      centerTitle: true,
      actionsIconTheme: const IconThemeData(color: Colors.black),
    ),

    // Text
    textTheme: AppTypography.lightTextTheme,
    snackBarTheme: SnackBarThemeData(backgroundColor: AppColors.primary),

    // Icon
    iconTheme: IconThemeData(color: AppColors.primary),
    popupMenuTheme: const PopupMenuThemeData(color: Colors.black12),

    // InputDecoration
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14, color: Colors.black),
      hintStyle: TextStyle(fontSize: 14, color: Colors.black12),
    ),

    // Card
    cardTheme: CardThemeData(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black12),
        borderRadius: BorderRadius.circular(4),
      ),
    ),

    // Chip
    chipTheme: ChipThemeData.fromDefaults(
      secondaryColor: AppColors.primary,
      labelStyle: TextStyle(color: AppColors.primary, fontSize: 12),
      primaryColor: AppColors.primary,
    ),

    // Radio
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
    ),

    // Check
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => AppColors.primary),
    ),

    // TabBar Theme
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.primary,
      indicator: UnderlineTabIndicator(
        // color for indicator (underline)
        borderSide: BorderSide(color: AppColors.secondary.shade500, width: 3),
      ),
    ),
  );

  // —————————————————————————————————————————————————————————————————————————————
  // dark
  // —————————————————————————————————————————————————————————————————————————————
  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: AppColors.black,
    primaryColorDark: AppColors.black,
    primaryColorLight: AppColors.black,
    primaryIconTheme: const IconThemeData(color: Colors.black12),
    colorScheme: const ColorScheme.dark(primary: Colors.black12)
        .copyWith(secondary: AppColors.black),
    cardColor: Colors.white,
    scaffoldBackgroundColor: AppColors.black,
    disabledColor: Colors.black12,
    hintColor: Colors.black12,
    dividerColor: Colors.black12,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.black,
    ),
    listTileTheme: ListTileThemeData(
      textColor: AppColors.black,
      minLeadingWidth: 16,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.black12,
      shadowColor: AppColors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 1.0,
      titleTextStyle: AppTypography.darkTextTheme.titleMedium
          ?.copyWith(fontWeight: FontWeight.w400),
      toolbarTextStyle: const TextStyle(color: Colors.white),
      centerTitle: false,
      actionsIconTheme: const IconThemeData(color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.black,
      textTheme: ButtonTextTheme.accent,
      colorScheme: ColorScheme.highContrastDark(),
    ),
    cardTheme: const CardThemeData(
      color: Colors.black12,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => AppColors.black),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (states) => const TextStyle(color: Colors.white)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (states) => const TextStyle(color: Colors.white)),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.black),
    iconTheme: const IconThemeData(color: Colors.white),
    popupMenuTheme: const PopupMenuThemeData(color: Colors.black12),
    textTheme: AppTypography.darkTextTheme,
  );
}
