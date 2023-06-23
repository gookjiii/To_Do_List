import 'package:flutter/material.dart';

import '../common/colors.dart';

ThemeData lightTheme() => ThemeData(
      cardColor: AppColorsLightTheme.backSecondary,
      appBarTheme: const AppBarTheme(color: AppColorsLightTheme.backPrimary),
      primaryColor: AppColorsLightTheme.primary,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 32, height: 38 / 32),
          titleMedium: TextStyle(
            fontSize: 20,
            height: 1,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            height: 24,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
              fontSize: 16,
              height: 20 / 16,
              fontWeight: FontWeight.w400,
              color: AppColorsLightTheme.tertiary),
          headlineSmall: TextStyle(
            fontSize: 14,
            height: 20 / 14,
            fontWeight: FontWeight.w400,
          )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColorsLightTheme.blue,
        foregroundColor: AppColorsLightTheme.white,
      ),
      // buttonTheme: const ButtonThemeData(buttonColor: AppColorsLightTheme.blue),
      scaffoldBackgroundColor: AppColorsLightTheme.backPrimary,
    );
