class AuthState {
  final AuthPageState pageState;
  final bool isPasswordMasked;
  final int? codeFromEmail;
  final String? emailForRestorePassword;
  final bool policyAgree;
  final String userName;
  final String email;
  final String password;

  AuthState(
      {this.pageState = AuthPageState.signIn,
      this.isPasswordMasked = true,
      this.codeFromEmail,
      this.emailForRestorePassword,
      this.policyAgree = true,
      this.email = '',
      this.password = '',
      this.userName = ''});

  AuthState copyWith({
    AuthPageState? pageState,
    bool? isPasswordMasked,
    int? codeFromEmail,
    String? emailForRestorePassword,
    bool? policyAgree,
    String? userName,
    String? email,
    String? password,
  }) {
    return AuthState(
        pageState: pageState ?? this.pageState,
        isPasswordMasked: isPasswordMasked ?? this.isPasswordMasked,
        codeFromEmail: codeFromEmail ?? this.codeFromEmail,
        emailForRestorePassword:
            emailForRestorePassword ?? this.emailForRestorePassword,
        policyAgree: policyAgree ?? this.policyAgree,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password);
  }
}

enum AuthPageState {
  signUp('Регистрация'),
  signIn('Вход');

  final String pageName;

  const AuthPageState(this.pageName);
}
