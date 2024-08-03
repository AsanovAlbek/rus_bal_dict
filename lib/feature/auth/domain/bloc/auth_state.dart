class AuthState {
  final AuthPageState pageState;
  final bool isPasswordMasked;
  final int? codeFromEmail;
  final String? emailForRestorePassword;

  AuthState(
      {this.pageState = AuthPageState.signIn,
      this.isPasswordMasked = true,
      this.codeFromEmail,
      this.emailForRestorePassword});

  AuthState copyWith(
      {AuthPageState? pageState,
      bool? isPasswordMasked,
      int? codeFromEmail,
      String? emailForRestorePassword}) {
    return AuthState(
        pageState: pageState ?? this.pageState,
        isPasswordMasked: isPasswordMasked ?? this.isPasswordMasked,
        codeFromEmail: codeFromEmail ?? this.codeFromEmail,
        emailForRestorePassword:
            emailForRestorePassword ?? this.emailForRestorePassword);
  }
}

enum AuthPageState {
  signUp('Регистрация'),
  signIn('Вход');

  final String pageName;

  const AuthPageState(this.pageName);
}
