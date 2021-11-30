import 'package:flutter/material.dart';

class ThemeAndColor {
  static const Color themeColor = Color(0xFF7EB342);

  static const Map<int, Color> themeMapColor = {
    50: Color.fromRGBO(126, 179, 66, .1),
    100: Color.fromRGBO(126, 179, 66, .2),
    200: Color.fromRGBO(126, 179, 66, .3),
    300: Color.fromRGBO(126, 179, 66, .4),
    400: Color.fromRGBO(126, 179, 66, .5),
    500: Color.fromRGBO(126, 179, 66, .6),
    600: Color.fromRGBO(126, 179, 66, .7),
    700: Color.fromRGBO(126, 179, 66, .8),
    800: Color.fromRGBO(126, 179, 66, .9),
    900: Color.fromRGBO(126, 179, 66, 1),
  };

  static const List<Color> starColorList = [
    Color(0xffFF5C6B),
    Color(0xffDBB049),
    Color(0xff7A5AB5),
    Color(0xff00D099),
    Color(0xff0094D4),
  ];

  static Color greyColor = Colors.grey;
  static Color whiteColor = Colors.white;
  static Color blackColor = Colors.black45;
  static const Color secondaryColor = Color(0xFFE91F24);
  static const Color leftGradientColor = Color(0xFF7EB342);
  static const Color rightGradientColor = Color(0xFF9ADB47);
  static const Color buttonBGColor = Color(0xFFEDEDED);

  static final appTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primarySwatch: const MaterialColor(0xFF7EB342, themeMapColor),
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: const MaterialColor(
      0xff096799,
      themeMapColor,
    )).copyWith(
      secondary: secondaryColor,
    ),
    fontFamily: 'openSans',
    canvasColor: Colors.transparent,
    textTheme: const TextTheme(
      headline1: TextStyle(fontFamily: "openSans"),
      headline2: TextStyle(fontFamily: "openSans"),
      headline3: TextStyle(fontFamily: "openSans"),
      headline4: TextStyle(fontFamily: "openSans"),
      headline5: TextStyle(fontFamily: "openSans"),
      headline6: TextStyle(fontFamily: "openSans"),
      subtitle1: TextStyle(fontFamily: "openSans"),
      subtitle2: TextStyle(fontFamily: "openSans"),
      bodyText1: TextStyle(fontFamily: "openSans"),
      bodyText2: TextStyle(fontFamily: "openSans"),
      caption: TextStyle(fontFamily: "openSans"),
      button: TextStyle(fontFamily: "openSans"),
      overline: TextStyle(fontFamily: "openSans"),
    ),
  );
}
