// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_word_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteWordHiveModelAdapter extends TypeAdapter<FavoriteWordHiveModel> {
  @override
  final int typeId = 2;

  @override
  FavoriteWordHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteWordHiveModel(
      id: fields[0] == null ? 0 : fields[0] as int,
      wordId: fields[1] == null ? 0 : fields[1] as int,
      userId: fields[2] == null ? 0 : fields[2] as int,
      word: fields[3] == null ? '' : fields[3] as String,
      meaning: fields[4] == null ? '' : fields[4] as String,
      audioBytes: fields[5] as Uint8List?,
      editedTime: fields[6] == null ? 0 : fields[6] as int,
      audioUrl: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteWordHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.wordId)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.word)
      ..writeByte(4)
      ..write(obj.meaning)
      ..writeByte(5)
      ..write(obj.audioBytes)
      ..writeByte(6)
      ..write(obj.editedTime)
      ..writeByte(7)
      ..write(obj.audioUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteWordHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
