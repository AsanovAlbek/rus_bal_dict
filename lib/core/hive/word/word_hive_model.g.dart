// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordHiveModelAdapter extends TypeAdapter<WordHiveModel> {
  @override
  final int typeId = 0;

  @override
  WordHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WordHiveModel(
      id: fields[0] == null ? 0 : fields[0] as int,
      word: fields[1] == null ? '' : fields[1] as String,
      meaning: fields[2] == null ? '' : fields[2] as String,
      audioUrl: fields[3] == null ? '' : fields[3] as String,
      createTime: fields[4] == null ? 0 : fields[4] as int,
      userId: fields[5] == null ? 0 : fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WordHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.word)
      ..writeByte(2)
      ..write(obj.meaning)
      ..writeByte(3)
      ..write(obj.audioUrl)
      ..writeByte(4)
      ..write(obj.createTime)
      ..writeByte(5)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
