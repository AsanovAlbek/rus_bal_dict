enum EnvironmentConfig {
  balRus('http://balrusapi.kbncran.ru/'),
  rusBal('http://rusbalapi.kbncran.ru/'),
  rusKab('http://ruskabapi.kbncran.ru/'),
  balRusTest('https://balrus-dict-api.onrender.com/'),
  rusBalTest('https://rusbal-dict-api.onrender.com/'),
  rusKabTest('Пока не добавил'),
  localTest('http://192.168.177.2:8000/'),
  localHostTest('http://127.0.0.1:8000/');

  final String apiUrl;
  const EnvironmentConfig(this.apiUrl);
}
