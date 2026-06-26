enum Flavor { balRus, rusbal, rusKab }

class AppFlavor {
  static const String _flavorName = String.fromEnvironment(
    'APP_FLAVOR',
    defaultValue: 'bal_rus',
  );

  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'Балкаро-русский словарь',
  );

  static const String greeting = String.fromEnvironment(
    'APP_GREETING',
    defaultValue: 'Хош келигиз!',
  );

  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://10.0.0.62:8000/',
  );

  static Flavor get flavor => switch (_flavorName) {
        'rus_bal' => Flavor.rusbal,
        'rus_kab' => Flavor.rusKab,
        _ => Flavor.balRus,
      };
}
