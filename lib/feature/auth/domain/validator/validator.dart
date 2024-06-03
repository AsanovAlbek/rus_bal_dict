final RegExp _usernameRegex = RegExp(r'^[a-zA-ZА-Яа-яёЁ0-9_ ]{2,32}$');
final RegExp _emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
final RegExp _passwordRegex = RegExp(r'^(?=.*[a-zа-яё])(?=.*[A-ZА-ЯЁ])(?=.*[0-9])[a-zA-Z0-9]{8,}$');

class AuthValidator {
  static String? validateUserName(String? username) {
    return _usernameRegex.hasMatch(username ?? '')
        ? null
        : 'Имя должно быть из букв, цифр и может включать в себя от 2 до 32 букв';
  }

  static String? validateEmail(String? email) {
    return _emailRegex.hasMatch(email ?? '') ? null : 'Некорректная почта';
  }

  static String? validatePassword(String? password) {
    return _passwordRegex.hasMatch(password ?? '')
        ? null
        : 'Пароль должен содержать минимум 1 маленькую, 1 большую буквы, 1 цифру и быть не менее 8 символов';
  }
}
