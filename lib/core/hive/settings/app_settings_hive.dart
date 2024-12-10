import 'package:hive/hive.dart';
part 'app_settings_hive.g.dart';

@HiveType(typeId: 1)
class AppSettingsHiveModel extends HiveObject {
  @HiveField(0, defaultValue: 0)

  /// id пользователя, != null если пользователь авторизирован
  int? userId;

  @HiveField(1, defaultValue: '')

  /// Имя пользователя
  String? userName;

  @HiveField(2, defaultValue: false)

  /// Зашёл ли пользователь
  bool isUserSignedIn;

  @HiveField(3, defaultValue: 0)

  /// Настройки темы (hive не хочет хранить вложенные кастомные объекты, поэтому енам храним по индексу)
  int themeMode;

  @HiveField(4, defaultValue: 1.0)

  /// Настройки размера шрифта
  double? fontSize;

  @HiveField(5, defaultValue: null)

  /// Настройки времени жизни записей в истории.
  /// Все записи, срок которых истек удаляются
  /// Если null, то записи не удаляются из истории
  Duration? historyStaleLimitTime;

  @HiveField(6, defaultValue: null)
  String? email;

  @HiveField(7, defaultValue: 0)
  int premiumDays;

  AppSettingsHiveModel(
      {this.userId,
      this.userName,
      this.isUserSignedIn = false,
      this.themeMode = 0,
      this.fontSize,
      this.historyStaleLimitTime,
      this.email,
      this.premiumDays = 0});
}
