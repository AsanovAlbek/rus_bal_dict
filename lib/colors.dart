import 'package:flutter/material.dart';
sealed class AppColors {

}

class AppLightColors extends AppColors {
  static const gradientStartColor = Color.fromRGBO(197, 255, 195, 1);
  static const gradientEndColor = Color.fromRGBO(68, 176, 105, 1);
  static const surfaceContainerColor = Color.fromRGBO(93, 192, 122, 0.7);
  static const backgroundColor = Color.fromRGBO(241, 241, 241, 1);
  static const surfaceColor = Color.fromRGBO(255, 254, 254, 1);
  static const onPrimaryColor = Colors.black;
  static const dividerColor = Color.fromRGBO(21, 171, 99, 0.54);
  static const starFilledColor = Color.fromRGBO(21, 171, 99, 0.92);

}

class AppDarkColors extends AppColors {
  static const gradientStartColor = Color.fromRGBO(7, 18, 57, 1);
  static const gradientEndColor = Color.fromRGBO(10, 7, 24, 1);
  static const cardBackgroundColor = Color.fromRGBO(66, 70, 88, 1);
  static const dividerColor = Color.fromRGBO(227, 227, 227, 0.3);
  static const backgroundColor = Color.fromRGBO(44, 47, 59, 1);
  static const cardShadowColor = Color.fromRGBO(0, 0, 0, 0.25);

}