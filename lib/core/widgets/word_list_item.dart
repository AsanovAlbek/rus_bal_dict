import 'package:flutter/material.dart';

import '../model/word/word.dart';
class WordListItem extends StatelessWidget {
  final Word word;
  final bool showActions;
  final Function(Word)? onPressed;
  final Function(Word)? onSaveWord;
  final Function(Word)? onShareWord;
  const WordListItem({super.key, required this.word, this.showActions = false, this.onPressed, this.onSaveWord, this.onShareWord});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(word.word),
      onTap: () => onPressed?.call(word),
      trailing: Visibility(
        visible: showActions,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: () => onSaveWord?.call(word), icon: const Icon(Icons.star)),
            IconButton(onPressed: () => onShareWord?.call(word), icon: const Icon(Icons.share)),
          ],
        ),
      ),
    );
  }

}