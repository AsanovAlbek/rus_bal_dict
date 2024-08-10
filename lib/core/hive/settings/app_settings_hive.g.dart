// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingsHiveModelAdapter extends TypeAdapter<AppSettingsHiveModel> {
  @override
  final int typeId = 1;

  @override
  AppSettingsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettingsHiveModel(
      userId: fields[0] == null ? 0 : fields[0] as int?,
      userName: fields[1] == null ? '' : fields[1] as String?,
      isUserSignedIn: fields[2] == null ? false : fields[2] as bool,
      themeMode: fields[3] == null ? 0 : fields[3] as int,
      fontSize: fields[4] == null ? 1.0 : fields[4] as double?,
      historyStaleLimitTime: fields[5] as Duration?,
      email: fields[6] as String?,
      premiumDays: fields[7] == null ? 0 : fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AppSettingsHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.isUserSignedIn)
      ..writeByte(3)
      ..write(obj.themeMode)
      ..writeByte(4)
      ..write(obj.fontSize)
      ..writeByte(5)
      ..write(obj.historyStaleLimitTime)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.premiumDays);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
