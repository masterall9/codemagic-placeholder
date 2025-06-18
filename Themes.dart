import 'package:colibricmflutter/Widget/Colors.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names

//backRound Clolor Login
const colorThame = Color(0xff118FF0);
const backroundLoginColor = Color.fromARGB(255, 192, 219, 245);
const Color ColorDarkComponents = Color(0xff38404b);
//***************************************************** */

const Color backRoundColorSearch = Color(0xffF8F9FD);
const Color backRoundColorSearchDark = Color.fromARGB(255, 0, 0, 0);
const Color ColorDarkBackground = Color(0xff1E252B);

const Color WhiteBack = Color(0xffEDF0F5);
const Color languageSettings = Color(0xff080E1D);
const Color darkGreyClr = Color(0xFF080E1D);
const Color mainColor = Color(0xff00BE84);

class ThemesApp {
  static final light = ThemeData(
    primaryColor: mainColor,
    scaffoldBackgroundColor: scaffoldBackgroundColorLight,
    backgroundColor: Color(0xffFFFFFF),
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    scaffoldBackgroundColor: languageSettings,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
