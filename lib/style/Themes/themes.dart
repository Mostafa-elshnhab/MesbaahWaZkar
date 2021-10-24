import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.blue,
  dialogBackgroundColor: Color(0xFF253341),
  snackBarTheme: SnackBarThemeData(
    actionTextColor: Colors.black,
    disabledActionTextColor: Colors.black,
    backgroundColor: Colors.lightBlueAccent.withOpacity(.7),
  ),
  textTheme: TextTheme(
      caption: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'NotoKufi'),
      button: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'NotoKufi',
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: 'NotoKufi',
      ),
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: 'NotoKufi',
      )),
  scaffoldBackgroundColor: Color(0xFF15202B),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF253341),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.lightBlueAccent),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
    labelStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoKufi',
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.0,
      fontFamily: 'NotoKufi',
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF253341),
    elevation: 0,
    backwardsCompatibility: false,
    iconTheme: IconThemeData(color: Colors.white, size: 22),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoKufi',
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFF253341),
        statusBarIconBrightness: Brightness.light),
  ),
);

ThemeData lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.blue,
  dialogBackgroundColor: Colors.white,
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.black.withOpacity(.7),
  ),
  textTheme: TextTheme(
      caption: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'NotoKufi'),
      button: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'NotoKufi',
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'NotoKufi',
      ),
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontFamily: 'NotoKufi',
      )),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white.withOpacity(.5),
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.lightBlueAccent),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.black,
    labelStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoKufi',
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.0,
      fontFamily: 'NotoKufi',
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    backwardsCompatibility: false,
    iconTheme: IconThemeData(color: Colors.black, size: 22),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoKufi',
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
  ),
);
