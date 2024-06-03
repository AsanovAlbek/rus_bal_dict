class UserAlreadyExistException implements Exception {
  final String message;

  UserAlreadyExistException(this.message);

  @override
  String toString() {
    return 'UserAlreadyExistException{message: $message}';
  }
}

class UserNotFoundException implements Exception {
  final String message;

  UserNotFoundException(this.message);

  @override
  String toString() {
    return 'UserNotFoundException{message: $message}';
  }
}