import 'package:hive_flutter/adapters.dart';
part 'word_hive_model.g.dart';

@HiveType(typeId: 0)
class WordHiveModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String word;

  @HiveField(2)
  String meaning;

  @HiveField(3)
  String audioUrl;

  @HiveField(4)
  DateTime createTime;

  WordHiveModel({required this.id, required this.word, required this.meaning, required this.audioUrl, required this.createTime});
}