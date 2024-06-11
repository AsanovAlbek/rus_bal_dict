import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rus_bal_dict/colors.dart';

class AppIcons {
  static SvgPicture favoriteIcon(Brightness brightness) =>
      SvgPicture.asset(
        'assets/images/favorites.svg',
        colorFilter: ColorFilter.mode(
            brightness == Brightness.light ? AppLightColors.gradientStartColor : Colors.white,
            BlendMode.srcIn),
      );

  static SvgPicture favoritesNavigationIcon(Brightness brightness) =>
      SvgPicture.asset('assets/images/favorites.svg', colorFilter: ColorFilter.mode(
          brightness == Brightness.light ? Colors.black : Colors.white, BlendMode.srcIn),);

  static SvgPicture playAudioIcon(Brightness brightness) =>
      SvgPicture.asset(
        'assets/images/play_audio.svg',
        colorFilter: ColorFilter.mode(
            brightness == Brightness.light ? AppLightColors.gradientStartColor : Colors.white,
            BlendMode.srcIn),
      );
}
