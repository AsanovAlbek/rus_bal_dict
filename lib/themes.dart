import 'package:flutter/material.dart';
import 'package:rus_bal_dict/colors.dart';

final lightTheme = ThemeData.light().copyWith(
    textTheme: textTheme.copyWith(bodyMedium: textTheme.bodyMedium?.copyWith(color: Colors.black)),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppLightColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppLightColors.surfaceContainerColor, onPrimary: Colors.black),
    bottomNavigationBarTheme: bottomBarThemeLight,
    cardTheme: const CardTheme(
        color: AppLightColors.surfaceColor,
    ),
    dividerColor: AppLightColors.dividerColor);

final darkTheme = ThemeData.dark().copyWith(
    textTheme: textTheme.copyWith(bodyMedium: textTheme.bodyMedium?.copyWith(color: Colors.white)),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppDarkColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, onPrimary: Colors.white, onSurface: Colors.white),
    bottomNavigationBarTheme: bottomBarThemeDark,
    cardTheme: const CardTheme(
      color: AppDarkColors.cardBackgroundColor,
      shadowColor: AppDarkColors.cardShadowColor
    ),
    dividerColor: AppDarkColors.dividerColor);

const textTheme = TextTheme(bodyMedium: TextStyle(fontSize: 18));

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
