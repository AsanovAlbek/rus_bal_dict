import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/hive/favorite_word/favorite_word_hive_model.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';

import '../model/word/word.dart';

class WordListItem extends StatelessWidget {
  final Word word;
  final bool saveEnable;
  final bool playEndale;
  final Function(Word)? onPressed;
  final Function(Word)? onSaveWord;
  final Function(Word)? onPlaySound;

  const WordListItem(
      {super.key,
      required this.word,
      this.saveEnable = false,
      this.playEndale = false,
      this.onPressed,
      this.onSaveWord,
      this.onPlaySound});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Visibility(
              visible: saveEnable,
              child: IconButton(
                  onPressed: () => onSaveWord?.call(word),
                  icon: Icon(
                    Icons.star,
                    color: Hive.box<FavoriteWordHiveModel>('favorites').containsKey(word.id)
                        ? Colors.yellow
                        : Colors.grey,
                  ))),
          title: Text(
            word.word.toCapitalized(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          onTap: () => onPressed?.call(word),
          trailing: Visibility(
            visible: playEndale,
            maintainSize: false,
            child: IconButton(onPressed: () => onPlaySound?.call(word), icon: const Icon(Icons.play_arrow)),
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
