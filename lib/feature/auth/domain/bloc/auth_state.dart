import 'package:equatable/equatable.dart';
import 'package:rus_bal_dict/core/model/login_data/login_data.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';

class AuthState with EquatableMixin {
  final AuthPageState pageState;
  final bool isPasswordMasked;
  final int? codeFromEmail;
  final String? emailForRestorePassword;
  final bool policyAgree;
  final bool termOfUseAgree;
  final String? userName;
  final String? email;
  final String? password;
  final User? user;
  final LoginData loginData;

  AuthState({
    this.pageState = AuthPageState.signIn,
    this.isPasswordMasked = true,
    this.codeFromEmail,
    this.emailForRestorePassword,
    this.policyAgree = false,
    this.termOfUseAgree = false,
    this.email,
    this.user,
    this.password,
    this.userName,
    this.loginData = const LoginData(),
  });

  AuthState copyWith({
    AuthPageState? pageState,
    bool? isPasswordMasked,
    int? codeFromEmail,
    String? emailForRestorePassword,
    bool? policyAgree,
    bool? termOfUseAgree,
    String? userName,
    String? email,
    String? password,
    User? user,
    LoginData? loginData
  }) {
    return AuthState(
        pageState: pageState ?? this.pageState,
        isPasswordMasked: isPasswordMasked ?? this.isPasswordMasked,
        codeFromEmail: codeFromEmail ?? this.codeFromEmail,
        emailForRestorePassword:
            emailForRestorePassword ?? this.emailForRestorePassword,
        policyAgree: policyAgree ?? this.policyAgree,
        termOfUseAgree: termOfUseAgree ?? this.termOfUseAgree,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        user: user ?? this.user,
        loginData: loginData ?? this.loginData,);
  }

  @override
  List<Object?> get props => [
        pageState,
        isPasswordMasked,
        codeFromEmail,
        emailForRestorePassword,
        policyAgree,
        termOfUseAgree,
        userName,
        email,
        password,
        loginData
      ];
}

enum AuthPageState {
  signUp('Регистрация'),
  signIn('Вход');

  final String pageName;

  const AuthPageState(this.pageName);
}
