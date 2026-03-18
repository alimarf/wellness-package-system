import 'package:flutter/material.dart';

class AppColors {
  static Color colorMode(bool isDarkMode) => isDarkMode ? white : black;

  static MaterialColor primary = const MaterialColor(
    primaryValue,
    <int, Color>{
      100: Color(0XFFB5E8FE),
      200: Color(0XFF84D7FD),
      300: Color(0xFF55C9FB),
      400: Color(0xFF34BCFB),
      500: Color(0xFF23AEF9),
      600: Color(0xFF20A0EA),
      700: Color(0xFF1D8CD5),
      800: Color(0xFF1B7CC1),
      900: Color(0xFF155C9F),
    },
  );
  static const int primaryValue = 0xFF23AEF9;
  static const Color primaryDark = Color(0xFF155C9F);
  static const Color primaryLight = Color(0xFF55C9FB);

  static MaterialColor secondary = const MaterialColor(
    secondaryValue,
    <int, Color>{
      100: Color(0xFFFEEFCE),
      200: Color(0xFFFEDB9F),
      300: Color(0xFFFCC26E),
      400: Color(0xFFF9A84A),
      500: Color(0xFFFFC527),
      600: Color(0xFFD3620B),
      700: Color(0xFFD3620B),
      800: Color(0xFFFEA51E),
      900: Color(0xFF8E3205),
    },
  );
  static const int secondaryValue = 0xFFFFC527;
  static const secondaryDark = Color(0xFF8E3205);
  static const secondaryLight = Color(0xFFFEEFCE);

  static MaterialColor neutral = const MaterialColor(
    _neutralValue,
    <int, Color>{
      50: Color(0xFFF6F7F9),
      100: Color(0xFFE5E7EA),
      150: Color(0xFFD8DCE0),
      200: Color(0xFFC7CBCF),
      250: Color(0xFFB4B8BC),
      300: Color(0xFF9EA9AD),
      400: Color(0xFF7F8790),
      500: Color(0xFF676E76),
      600: Color(0xFF596066),
      700: Color(0xFF454C52),
      800: Color(0xFF383F45),
      900: Color(0xFF000C17),
    },
  );
  static const int _neutralValue = 0xFF676E76;
  static const neutralDark = Color(0xFF383F45);
  static const neutralLight = Color(0xFFD8DCE0);
  static const neutralSuperLight = Color(0xFFE5E7EA);

  static MaterialColor disclaimer = const MaterialColor(
    _disclaimerValue,
    <int, Color>{
      50: Color(0xFFFFF9F2),
      100: Color(0xFFFEF2E5),
      200: Color(0xFFFBC895),
      300: Color(0xFFF9B26F),
      400: Color(0xFFF7A259),
      500: Color(0xFFF69348),
      600: Color(0xFFF08845),
      700: Color(0xFFE87A41),
      800: Color(0xFFE06C3D),
      900: Color(0xFFD55536),
    },
  );
  static const int _disclaimerValue = 0xFFF69348;

  static MaterialColor infoColor = const MaterialColor(
    _infoColorValue,
    <int, Color>{
      100: Color(0XFF4DB6E4),
      200: Color(0XFF33ABE0),
      300: Color(0XFF1AA1DC),
      400: Color(0XFF0096D8),
      500: Color(0XFF0087C2),
      600: Color(0XFF0078AD),
      700: Color(0XFF006997),
      800: Color(0XFF005A82),
      900: Color(0XFF004B6C),
    },
  );
  static const int _infoColorValue = 0XFF0087C2;

  static MaterialColor warning = const MaterialColor(
    _warningValue,
    <int, Color>{
      50: Color(0XFFFFF59D),
      100: Color(0XFFFFF9C4),
      200: Color(0XFFFFF59D),
      300: Color(0XFFFFF176),
      400: Color(0XFFFFEE58),
      500: Color(0XFFFFEB3B),
      600: Color(0XFFFDD835),
      700: Color(0XFFFBC02D),
      800: Color(0XFFF9A825),
      900: Color(0XFFF57F17),
    },
  );
  static const int _warningValue = 0XFFFFEB3B;

  static MaterialColor success = const MaterialColor(
    _successValue,
    <int, Color>{
      100: Color(0XFF6DBA77),
      200: Color(0XFF59B163),
      300: Color(0XFF44A750),
      400: Color(0XFF2F9D3C),
      500: Color(0XFF2A8D36),
      600: Color(0XFF267E30),
      700: Color(0XFF216E2A),
      800: Color(0XFF1C5E24),
      900: Color(0XFF184F1E),
    },
  );
  static const int _successValue = 0XFF2A8D36;
  static const successDark = Color(0XFF184F1E);
  static const successLight = Color(0XFF6DBA77);

  static MaterialColor error = const MaterialColor(
    errorValue,
    <int, Color>{
      100: Color(0XFFFF6E6E),
      200: Color(0XFFFF5959),
      300: Color(0XFFFF4545),
      400: Color(0XFFFF3030),
      500: Color(0XFFE62B2B),
      600: Color(0XFFCC2626),
      700: Color(0XFFB32222),
      800: Color(0XFF991D1D),
      900: Color(0XFF801818),
    },
  );
  static const int errorValue = 0XFFE62B2B;

  static MaterialColor gray = const MaterialColor(
    _grayValue,
    <int, Color>{
      25: Color(0xFFFAFAFA),
      50: Color(0XFFF5F5F6),
      100: Color(0XFFE6E6EA),
      200: Color(0XFFD1D0D3),
      300: Color(0XFFABA8B3),
      400: Color(0XFF948F9E),
      500: Color(0XFF7C7788),
      600: Color(0XFF635F6D),
      700: Color(0XFF4A4752),
      800: Color(0XFF322F37),
      900: Color(0XFF19181B),
    },
  );
  static const int _grayValue = 0XFF7C7788;
  static const grayDark = Color(0XFF322F37);
  static const grayLight = Color(0XFFABA8B3);

  static MaterialColor black = const MaterialColor(
    _blackValue,
    <int, Color>{
      100: Color(0XFFE0E0E0),
      200: Color(0XFF5F5F5F),
      300: Color(0XFF313131),
      400: Color(0XFF2B2B2B),
      500: Color(0XFF262626),
      600: Color(0XFF212121),
      700: Color(0XFF1E1E1E),
      800: Color(0XFF1B1B1B),
      900: Color(0XFF0E0E0E),
    },
  );
  static const int _blackValue = 0XFF262626;

  // —————————————————————————————————————————————————————————————————————————————
  // basic color !!
  // —————————————————————————————————————————————————————————————————————————————
  static const white = Colors.white;
  static const transparent = Colors.transparent;
  static const textTitleColor = Color(0xFF25315B);
  static const textSubTitleColor = Color(0xFF838EAB);
  static const textBodyColor = Color(0xFF838EAB);
  static const textTertiaryColor = Color(0xFF989898);
  static const textTagColor = Color(0xFFE9E9E9);
  static const textPlainButton = Color(0xFF4A4A4A);
  static const dividerColor = Color(0xFFEBEEF7);
  static const plainButtonColor = Color(0xFFD8D8D8);
  static const backgroundColor = Color(0xFFF8F8F8);
}
