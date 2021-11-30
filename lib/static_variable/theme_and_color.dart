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
  static const Color leftGredientColor = Color(0xFF7EB342);
  static const Color rightGredientColor = Color(0xFF9ADB47);
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
    fontFamily: 'ubuntu',
    canvasColor: Colors.transparent,
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontFamily: "ubuntu", fontWeight: FontWeight.bold, fontSize: 22),
      headline2: TextStyle(
          fontFamily: "ubuntu", fontWeight: FontWeight.bold, fontSize: 18),
      headline3: TextStyle(
          fontFamily: "ubuntu", fontWeight: FontWeight.bold, fontSize: 14),
      headline4: TextStyle(
          fontFamily: "ubuntu", fontWeight: FontWeight.bold, fontSize: 12),
      headline5: TextStyle(
          fontFamily: "ubuntu", fontWeight: FontWeight.bold, fontSize: 10),
      headline6: TextStyle(fontFamily: "ubuntu", fontSize: 10),
      subtitle1: TextStyle(fontFamily: "ubuntu"),
      subtitle2: TextStyle(fontFamily: "ubuntu"),
      bodyText1: TextStyle(fontFamily: "ubuntu"),
      bodyText2: TextStyle(fontFamily: "ubuntu"),
      caption: TextStyle(fontFamily: "ubuntu"),
      button: TextStyle(fontFamily: "ubuntu"),
      overline: TextStyle(fontFamily: "ubuntu"),
    ),
  );
}
