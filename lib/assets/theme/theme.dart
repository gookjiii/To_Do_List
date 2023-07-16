import 'package:flutter/material.dart';

abstract class AppTheme {
  static const _primaryTextColorLight = Color(0xFF000000);
  static const _primaryTextColorDark = Color(0xFFFFFFFF);
  static const _tertiaryLight = Color(0x4D000000);
  static const _tertiaryDark = Color(0x66FFFFFF);
  static const _primaryColorLight = Color(0xFF007AFF);
  static const _primaryColorDark = Color(0xFF0A84FF);
  static const red = Color(0xFFFF3B30);
  static const green = Color(0xFF34C759);
  static const _redLight = Color(0xFFFF3B30);
  static const _redDark = Color(0xFFFF453A);
  static const _greenLight = Color(0xFF34C759);
  static const _greenDark = Color(0xFF32D74B);

  static ThemeData get lightTheme => ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: _primaryColorLight),
        toggleableActiveColor: _greenLight,
        errorColor: _redLight,
        colorScheme: const ColorScheme.light(
          primary: _primaryColorLight,
          onPrimary: Colors.white,
          onSurface: _primaryTextColorLight,
        ),
        disabledColor: const Color(0x26000000),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintStyle: TextStyle(
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w400,
            color: _tertiaryLight,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFF7F6F2),
          elevation: 0,
          iconTheme: IconThemeData(color: _primaryTextColorLight),
        ),
        primaryColor: _primaryColorLight,
        dividerColor: Colors.black.withOpacity(.2),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(
            Colors.white,
          ),
        ),
        hintColor: _tertiaryLight,
        scaffoldBackgroundColor: const Color(0xFFF7F6F2),
        backgroundColor: const Color(0xFFFFFFFF),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            height: 38 / 32,
            color: _primaryTextColorLight,
          ),
          headline2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 32 / 20,
            color: _primaryTextColorLight,
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w400,
            color: _primaryTextColorLight,
          ),
          button: TextStyle(
            fontSize: 14,
            height: 24 / 14,
            fontWeight: FontWeight.w500,
            color: _primaryTextColorLight,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            height: 20 / 14,
            fontWeight: FontWeight.w400,
            color: _primaryTextColorLight,
          ),
          overline: TextStyle(
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.10,
            color: _tertiaryLight,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        toggleableActiveColor: _greenDark,
        errorColor: _redDark,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: _primaryColorDark),
        colorScheme: const ColorScheme.dark(
          surface: _primaryColorDark,
          primary: _primaryColorDark,
          onPrimary: Colors.white,
          onSurface: _primaryTextColorDark,
        ),
        disabledColor: const Color(0x26FFFFFF),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintStyle: TextStyle(
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w400,
            color: _tertiaryDark,
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF161618),
          elevation: 0,
          iconTheme: IconThemeData(color: _primaryTextColorDark),
        ),
        primaryColor: _primaryColorDark,
        dividerColor: Colors.white.withOpacity(.2),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all(
            Colors.black,
          ),
        ),
        hintColor: _tertiaryDark,
        scaffoldBackgroundColor: const Color(0xFF161618),
        backgroundColor: const Color(0xFF252528),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            height: 38 / 32,
            color: _primaryTextColorDark,
          ),
          headline2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 32 / 20,
            color: _primaryTextColorDark,
          ),
          bodyText2: TextStyle(
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w400,
            color: _primaryTextColorDark,
          ),
          button: TextStyle(
            fontSize: 14,
            height: 24 / 14,
            fontWeight: FontWeight.w500,
            color: _primaryTextColorDark,
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            height: 20 / 14,
            fontWeight: FontWeight.w400,
            color: _primaryTextColorDark,
          ),
          overline: TextStyle(
            fontSize: 16,
            height: 20 / 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.10,
            color: _tertiaryDark,
          ),
        ),
      );
}
