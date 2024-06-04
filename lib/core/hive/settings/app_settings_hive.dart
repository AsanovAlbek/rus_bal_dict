import 'package:hive/hive.dart';
part 'app_settings_hive.g.dart';

@HiveType(typeId: 1)
class AppSettingsHiveModel extends HiveObject {
  @HiveField(0)

  /// id пользователя, != null если пользователь авторизирован
  int? userId;

  @HiveField(1)

  /// Имя пользователя
  String? userName;

  @HiveField(2)

  /// Зашёл ли пользователь
  bool isUserSignedIn;

  @HiveField(3)

  /// Настройки темы (hive не хочет хранить вложенные кастомные объекты, поэтому енам храним по индексу)
  int themeMode;

  @HiveField(4)

  /// Настройки размера шрифта
  int? fontSize;

  @HiveField(5)
  /// Настройки времени жизни записей в истории.
  /// Все записи, срок которых истек удаляются
  /// Если null, то записи не удаляются из истории
  Duration? historyStaleLimitTime;

  AppSettingsHiveModel(
      {this.userId,
      this.userName,
      this.isUserSignedIn = false,
      this.themeMode = 0,
      this.fontSize,
      this.historyStaleLimitTime});
}
