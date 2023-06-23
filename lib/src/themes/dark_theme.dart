import 'package:flutter/material.dart';

import '../common/colors.dart';

ThemeData darkTheme() => ThemeData(
      cardColor: AppColorsDarkTheme.backSecondary,
      primaryColor: AppColorsDarkTheme.primary,
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 32, height: 38 / 32),
          titleMedium: TextStyle(
            fontSize: 20,
            height: 32 / 20,
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
          ),
          headlineSmall: TextStyle(
            fontSize: 14,
            height: 20 / 14,
            fontWeight: FontWeight.w400,
          )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColorsDarkTheme.blue,
        foregroundColor: AppColorsDarkTheme.white,
      ),
      buttonTheme: const ButtonThemeData(),
      scaffoldBackgroundColor: AppColorsDarkTheme.backPrimary,
    );
