import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';

sealed class AuthEvent {
  static SignInEvent signIn(
          {required String email,
          required String password,
          void Function(User, String)? onSuccess,
          void Function(String?)? onError}) =>
      SignInEvent(
          email: email,
          password: password,
          onSuccess: onSuccess,
          onError: onError);

  static SignUpEvent signUp(
          {required String name,
          required String email,
          required String password,
          void Function(User, String)? onSuccess,
          void Function(String?)? onError,
          void Function()? onUserNoAgreeWithPolicy}) =>
      SignUpEvent(
          name: name,
          email: email,
          password: password,
          onSuccess: onSuccess,
          onError: onError,
          onUserNoAgreeWithPolicy: onUserNoAgreeWithPolicy);

  static SignOutEvent signOut() => SignOutEvent();

  static MaskPasswordEvent maskPassword({required bool isPasswordMasked}) =>
      MaskPasswordEvent(isPasswordMasked: isPasswordMasked);

  static ChangeAuthPageEvent changeAuthPage(
          {required AuthPageState pageState}) =>
      ChangeAuthPageEvent(pageState: pageState);

  static SendCodeToEmailAuthEvent sendCodeToEmail({required String email}) =>
      SendCodeToEmailAuthEvent(email: email);

  static ChangeAgreeWithPolicyAuthEvent changeAgree({required bool? agree}) =>
      ChangeAgreeWithPolicyAuthEvent(agree);

  static SaveUserSignUpInputAuthEvent saveUserSignUpInput(
          {required String name,
          required String email,
          required String password,
          void Function()? onComplete}) =>
      SaveUserSignUpInputAuthEvent(
          email: email, password: password, name: name, onComplete: onComplete);
}

@immutable
class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  final void Function(User, String)? onSuccess;
  final void Function(String?)? onError;

  SignInEvent(
      {required this.email,
      required this.password,
      this.onSuccess,
      this.onError});
}

@immutable
class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final void Function(User, String)? onSuccess;
  final void Function(String?)? onError;
  final void Function()? onUserNoAgreeWithPolicy;

  SignUpEvent(
      {required this.name,
      required this.email,
      required this.password,
      this.onSuccess,
      this.onError,
      this.onUserNoAgreeWithPolicy});
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

@immutable
class SendCodeToEmailAuthEvent extends AuthEvent {
  final String email;
  final Function(int?)? onSuccess;
  final Function(String?)? onError;
  SendCodeToEmailAuthEvent({required this.email, this.onSuccess, this.onError});
}

@immutable
class UpdateUserPasswordAuthEvent extends AuthEvent {
  final String email;
  final String newPassword;
  final String confirmPassword;
  final Function()? onSuccess;
  final Function(String?)? onError;

  UpdateUserPasswordAuthEvent(
      {required this.email,
      required this.newPassword,
      required this.confirmPassword,
      this.onSuccess,
      this.onError});
}

@immutable
class ChangeAgreeWithPolicyAuthEvent extends AuthEvent {
  final bool? agreeWithPolicy;

  ChangeAgreeWithPolicyAuthEvent(this.agreeWithPolicy);
}

@immutable
class SaveUserSignUpInputAuthEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final void Function()? onComplete;

  SaveUserSignUpInputAuthEvent(
      {required this.email,
      required this.password,
      required this.name,
      this.onComplete});
}
