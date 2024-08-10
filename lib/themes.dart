import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rus_bal_dict/colors.dart';

final lightTheme = ThemeData.light().copyWith(
    textTheme: textTheme.copyWith(
        bodyMedium: textTheme.bodyMedium
            ?.copyWith(color: const Color.fromRGBO(0, 0, 0, 1)),
        bodySmall: textTheme.bodySmall?.copyWith(color: Colors.black)).apply(
          bodyColor: Colors.black, displayColor: Colors.black
        ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppLightColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppLightColors.surfaceContainerColor,
        onPrimary: Colors.black),
    bottomNavigationBarTheme: bottomBarThemeLight,
    cardTheme: const CardTheme(
      color: AppLightColors.surfaceColor,
    ),
    dividerColor: AppLightColors.dividerColor,
    iconTheme: const IconThemeData(color: Colors.black));

final darkTheme = ThemeData.dark().copyWith(
    textTheme: textTheme.copyWith(
        bodyMedium: textTheme.bodyMedium?.copyWith(color: Colors.white),
        bodySmall: textTheme.bodySmall?.copyWith(color: Colors.white)).apply(
          bodyColor: Colors.white, displayColor: Colors.white
        ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color.fromRGBO(44, 47, 59, 1),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        onPrimary: Colors.white,
        onSecondary: Colors.lightBlue[400],
        onSurface: Colors.white),
    bottomNavigationBarTheme: bottomBarThemeDark,
    cardTheme: const CardTheme(
        color: AppDarkColors.cardBackgroundColor,
        shadowColor: AppDarkColors.cardShadowColor),
    dividerColor: AppDarkColors.dividerColor,
    iconTheme: const IconThemeData(color: Colors.white));

final textTheme = GoogleFonts.interTextTheme(const TextTheme(
    bodyMedium: TextStyle(fontSize: 18),
    bodySmall: TextStyle(fontSize: 12),
    titleMedium: TextStyle(fontSize: 18),
    titleSmall: TextStyle(fontSize: 12)));

const bottomBarThemeLight = BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppLightColors.surfaceContainerColor,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
    showUnselectedLabels: true);

const bottomBarThemeDark = BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppDarkColors.gradientStartColor,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
    showUnselectedLabels: true);

const dividerLightTheme = DividerThemeData(color: AppLightColors.dividerColor);

const dividerDarkTheme = DividerThemeData(color: AppDarkColors.dividerColor);
