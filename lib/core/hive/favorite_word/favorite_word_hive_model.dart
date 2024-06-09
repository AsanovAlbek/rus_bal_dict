import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'favorite_word_hive_model.g.dart';

@HiveType(typeId: 2)
class FavoriteWordHiveModel with HiveObjectMixin {
  @HiveField(0, defaultValue: 0)
  final int id;
  @HiveField(1, defaultValue: 0)
  final int wordId;
  @HiveField(2, defaultValue: 0)
  final int userId;
  @HiveField(3, defaultValue: '')
  final String word;
  @HiveField(4, defaultValue: '')
  final String meaning;
  @HiveField(5, defaultValue: null)
  final Uint8List? audioBytes;
  @HiveField(6, defaultValue: 0)
  final int editedTime;

  FavoriteWordHiveModel(
      {required this.id,
      required this.wordId,
      required this.userId,
      required this.word,
      required this.meaning,
      required this.audioBytes,
      required this.editedTime});
}
