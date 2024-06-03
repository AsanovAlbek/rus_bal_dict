class AuthState {
  final AuthPageState pageState;
  final bool isPasswordMasked;

  AuthState({this.pageState = AuthPageState.signIn, this.isPasswordMasked = true});

  AuthState copyWith({AuthPageState? pageState, bool? isPasswordMasked}) {
    return AuthState(
        pageState: pageState ?? this.pageState,
        isPasswordMasked: isPasswordMasked ?? this.isPasswordMasked
    );
  }
}

enum AuthPageState {
  signUp('Регистрация'),
  signIn('Вход');

  final String pageName;

  const AuthPageState(this.pageName);
}
