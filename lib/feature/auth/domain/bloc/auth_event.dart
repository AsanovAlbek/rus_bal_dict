import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';

sealed class AuthEvent {
  static SignInEvent signIn(
          {required String email,
          required String password,
          void Function(User, String)? onSuccess,
          void Function(String?)? onError}) =>
      SignInEvent(email: email, password: password, onSuccess: onSuccess, onError: onError);

  static SignUpEvent signUp(
          {required String name,
          required String email,
          required String password,
          void Function(User, String)? onSuccess,
          void Function(String?)? onError}) =>
      SignUpEvent(name: name, email: email, password: password, onSuccess: onSuccess, onError: onError);

  static SignOutEvent signOut() => SignOutEvent();

  static MaskPasswordEvent maskPassword({required bool isPasswordMasked}) =>
      MaskPasswordEvent(isPasswordMasked: isPasswordMasked);

  static ChangeAuthPageEvent changeAuthPage({required AuthPageState pageState}) =>
      ChangeAuthPageEvent(pageState: pageState);
}

@immutable
class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  final void Function(User, String)? onSuccess;
  final void Function(String?)? onError;

  SignInEvent({required this.email, required this.password, this.onSuccess, this.onError});
}

@immutable
class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final void Function(User, String)? onSuccess;
  final void Function(String?)? onError;

  SignUpEvent(
      {required this.name, required this.email, required this.password, this.onSuccess, this.onError});
}

@immutable
class SignOutEvent extends AuthEvent {}

class MaskPasswordEvent extends AuthEvent {
  final bool isPasswordMasked;

  MaskPasswordEvent({required this.isPasswordMasked});
}

@immutable
class ChangeAuthPageEvent extends AuthEvent {
  final AuthPageState pageState;

  ChangeAuthPageEvent({required this.pageState});
}
