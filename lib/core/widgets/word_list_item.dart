import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/hive/favorite_word/favorite_word_hive_model.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/core/widgets/favorites_icon_button.dart';

import '../model/word/word.dart';

class WordListItem extends StatelessWidget {
  final Word word;
  final bool saveEnable;
  final bool playEndale;
  final Function(Word)? onPressed;
  final Function(Word)? onSaveWord;
  final Function(Word)? onPlaySound;
  final bool isFavorite;

  const WordListItem(
      {super.key,
      required this.word,
      this.saveEnable = false,
      this.playEndale = false,
      this.onPressed,
      this.onSaveWord,
      this.onPlaySound,
      this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color ?? Colors.black;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Visibility(
            visible: saveEnable,
            child: FavoritesIconButton(onPressed: () => onSaveWord?.call(word), isFavorite: isFavorite),
          ),
          title: Text(
            word.word.toCapitalized(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: () => onPressed?.call(word),
          trailing: Visibility(
            visible: playEndale,
            maintainSize: false,
            child: IconButton(
                onPressed: () => onPlaySound?.call(word),
                icon: SvgPicture.asset(
                  'assets/images/play_audio.svg',
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                )),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Divider(height: 2),
        )
      ],
    );
  }
}
