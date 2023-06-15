import 'package:flutter/material.dart';

abstract class AppColorsLightTheme {
  static const Color separator = Color.fromRGBO(0, 0, 0, 0.2);
  static const Color overlay = Color(0xFF0F0000);
  static const Color primary = Color(0xFF000000);
  static const Color secondory = Color(0xFF990000);
  static const Color tertiary = Color.fromRGBO(0, 0, 0, 0.3);
  static const Color disable = Color.fromRGBO(0, 0, 0, 0.15);
  static const Color red = Color.fromRGBO(255, 59, 48, 1);
  static const Color green = Color(0xFF34C759);
  static const Color blue = Color(0xFF007AFF);
  static const Color gray = Color(0xFF8E8E93);
  static const Color grayLight = Color(0xFFD1D1D6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backPrimary = Color(0xFFF7F6F2);
  static const Color backSecondary = Color(0xFFFFFFFF);
  static const Color elevated = Color(0xFFFFFFFF);
}

abstract class AppColorsDarkTheme {
  static const Color separator = Color.fromRGBO(255, 255, 255, 0.2);
  static const Color overlay = Color(0x52FFFFFF);
  static const Color primary = Color(0xFFFFFFFF);
  static const Color secondory = Color(0x99FFFFFF);
  static const Color tertiary = Color(0x66FFFFFF);
  static const Color disable = Color(0x26FFFFFF);
  static const Color red = Color(0xFFFF453A);
  static const Color green = Color(0xFF32D74B);
  static const Color blue = Color(0xFF0A84FF);
  static const Color gray = Color(0xFF8E8E93);
  static const Color grayLight = Color(0xFF48484A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backPrimary = Color(0xFF161618);
  static const Color backSecondary = Color(0xFF252528);
  static const Color elevated = Color(0xFF3C3C3F);
}
