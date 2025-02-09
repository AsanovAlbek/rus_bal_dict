import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';

sealed class AuthEvent {}

@immutable
class StartSessionEvent extends AuthEvent {
  final Function()? onSuccess;
  final Function([String? message])? onError;

  StartSessionEvent({this.onSuccess, this.onError});
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
  final void Function(String)? onSuccess;
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
class SignOutEvent extends AuthEvent {
  final Function()? onSuccess;
  final Function([String? message])? onError;

  SignOutEvent({this.onSuccess, this.onError});
}

class MaskPasswordEvent extends AuthEvent {
  final bool isPasswordMasked;

  MaskPasswordEvent({required this.isPasswordMasked});
}

@immutable
class ChangeAuthPageEvent extends AuthEvent {
  final AuthPageState pageState;

  ChangeAuthPageEvent({required this.pageState});
}

class SendRestoreCodeEvent extends AuthEvent {
  final String email;
  final Function()? onSuccess;
  final Function([String? message])? onError;

  SendRestoreCodeEvent({required this.email, this.onSuccess, this.onError});
}

class ConfirmRestoreCodeEvent extends AuthEvent {
  final String email;
  final String code;
  final Function()? onSuccess;
  final Function([String? message])? onError;

  ConfirmRestoreCodeEvent(
      {required this.email, required this.code, this.onSuccess, this.onError});
}

class SendActivationCodeEvent extends AuthEvent {
  final Function()? onSuccess;
  final Function()? onError;

  SendActivationCodeEvent({this.onSuccess, this.onError});
}

class ConfirmUserActivationEvent extends AuthEvent {
  final String code;
  final Function()? onSuccess;
  final Function([String? message])? onError;

  ConfirmUserActivationEvent(
      {required this.code, this.onSuccess, this.onError});
}

@immutable
class UpdateUserPasswordAuthEvent extends AuthEvent {
  final String email;
  final String newPassword;
  final String confirmPassword;
  final Function([String?])? onSuccess;
  final Function([String?])? onError;

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
class ChangeAgreeWithTermOfUseEvent extends AuthEvent {
  final bool? agreeWithTermOfUse;

  ChangeAgreeWithTermOfUseEvent(this.agreeWithTermOfUse);
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
