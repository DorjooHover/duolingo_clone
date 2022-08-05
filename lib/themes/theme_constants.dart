import "package:flutter/material.dart";

const white = Colors.white;
const mainBg = Color(0xFF141f23);
const mainGrey = Color(0xff394551);
const iconGrey = Color(0xFF4F626D);
const sunYellow = Color(0xfffed701);
const heartRed = Color(0xfffc494c);
const waterBlue = Color(0xff49c0f8);
const waterShadowBlue = Color(0xff1795d6);
const mainGreen = Color(0xff93d334);
const shadowGreen = Color(0xff76b730);
ThemeData lightTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: mainBg,
  splashColor: mainGrey,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.all<Color>(orangeClr),
        ),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontFamily: "Nunito",
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: heartRed,
    ),
    headline1: TextStyle(
      fontFamily: "Nunito",
      fontWeight: FontWeight.bold,
      fontSize: 60,
      color: white,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 60,
      color: white,
    ),
    headline3: TextStyle(
      fontFamily: "Nunito",
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: white,
    ),
    caption: TextStyle(
      fontFamily: "Nunito",
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: iconGrey,
    ),
    subtitle1: TextStyle(
      fontSize: 17,
      color: white,
    ),
    subtitle2: TextStyle(
      fontSize: 17,
      color: Color.fromARGB(255, 176, 188, 197),
    ),
  ),
  iconTheme: IconThemeData(color: mainGrey, size: 30),
);

// ThemeData darkTheme = ThemeData(
//   brightness: Brightness.dark,
// );

