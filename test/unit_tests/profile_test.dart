import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/export.dart';

import 'mock_models.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  final repository = MockProfileRepository();
  const userInfo = UserInfo(
      id: 1,
      name: 'UserName',
      isUserSignIn: false,
      email: 'user@mail.ru',
      premiumDays: 30);
  const settings = Settings();
  const appSettings = AppSettings(userInfo: userInfo, settings: settings);

  group('Тест на получение настроек приложения', () {
    test('Проверка сохранения настроек приложения', () async {
      when(() => repository.saveSettings(appSettings)).thenAnswer((_) async {});
      await repository.saveSettings(appSettings);
      verifyOnce(() => repository.saveSettings(appSettings));
      debugPrint('Сохранение настроек приложения. Успешно');
    });

    test('Проверка на ошибку сохранения настроек', () {
      when(() => repository.saveSettings(appSettings)).thenThrow(Exception());
      expect(() async => await repository.saveSettings(appSettings),
          throwsException);
      debugPrint('Проверка на ошибку сохранения настроек приложения. Успешно');
    });

    test('Проверка на сброс настроек на настройки по умолчанию', () async {
      when(() => repository.dropToDefault()).thenAnswer((_) async {});
      await repository.dropToDefault();
      verifyOnce(() => repository.dropToDefault());
      debugPrint('Сброс настроек приложения. Успешно');
    });

    test('Проверка на ошибку сброса настроек на настройки по умолчанию',
        () async {
      when(() => repository.dropToDefault()).thenThrow(Exception());
      expect(() => repository.dropToDefault(), throwsException);
      debugPrint('Проверка на ошибку сброса настроек приложения. Успешно');
    });
  });
}
