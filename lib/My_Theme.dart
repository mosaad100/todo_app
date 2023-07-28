import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimary = Color(0xff5D9CEC);
  static const Color darkPrimary = Color(0xff5D9CEC);
  static const Color lightScaffoldBack = Color(0xffDFECDB);
  static const Color darkScaffoldBack = Color(0xff060E1E);
  static const Color green = Color(0xff61E757);
  static const Color red = Color(0xffE43737);
  static final lightTheme = ThemeData(
    cardColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.black),
    primaryColor: lightPrimary,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: lightScaffoldBack,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        size: 35,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: lightPrimary,
        fontFamily: 'tajawal',
      ),
      headline2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: 'tajawal',
      ),
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: lightPrimary,
        fontFamily: 'tajawal',
      ),
    ),
  );
  static final darkTheme = ThemeData(
    cardColor: Colors.white,
    navigationBarTheme:
        NavigationBarThemeData(backgroundColor: Color(0xff060E1E)),
    primaryColor: darkPrimary,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color(0xff060E1E),
    scaffoldBackgroundColor: darkScaffoldBack,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        size: 35,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: lightPrimary,
        fontFamily: 'tajawal',
      ),
      headline2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: 'tajawal',
      ),
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: lightPrimary,
        fontFamily: 'tajawal',
      ),
    ),
  );
}
