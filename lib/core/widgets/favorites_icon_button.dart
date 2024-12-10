import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String _outlinedIconPath = 'assets/images/favorites.svg';
const String _filledIconPath = 'assets/images/favorites_filled.svg';

class FavoritesIconButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onPressed;

  const FavoritesIconButton(
      {super.key, this.isFavorite = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final outlinedColor =
        brightness == Brightness.light ? Colors.black : Colors.white;
    final filledColor =
        brightness == Brightness.light ? Colors.yellowAccent : Colors.white;
    final outlinedSvgIcon = SvgPicture.asset(_outlinedIconPath,
        colorFilter: ColorFilter.mode(outlinedColor, BlendMode.srcIn));
    final filledSvgIcon = SvgPicture.asset(_filledIconPath,
        colorFilter: ColorFilter.mode(filledColor, BlendMode.srcIn));
    return IconButton(
        onPressed: onPressed,
        icon: isFavorite ? filledSvgIcon : outlinedSvgIcon);
  }
}
