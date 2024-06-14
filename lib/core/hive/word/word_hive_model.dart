import 'package:hive_flutter/adapters.dart';

part 'word_hive_model.g.dart';

@HiveType(typeId: 0)
class WordHiveModel extends HiveObject {
  @HiveField(0, defaultValue: 0)
  int id;

  @HiveField(1, defaultValue: '')
  String word;

  @HiveField(2, defaultValue: '')
  String meaning;

  @HiveField(3, defaultValue: '')
  String audioUrl;

  @HiveField(4, defaultValue: 0)
  int createTime;

  @HiveField(5, defaultValue: 0)
  int userId;

  WordHiveModel(
      {required this.id,
      required this.word,
      required this.meaning,
      required this.audioUrl,
      required this.createTime,
      required this.userId});
}
