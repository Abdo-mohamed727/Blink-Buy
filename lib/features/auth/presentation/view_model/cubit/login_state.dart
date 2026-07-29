part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String message;
  final String token;

  LoginSuccess({
    required this.message,
    required this.token,
  });
}

final class LoginError extends LoginState {
  final String messageError;

  LoginError({
    required this.messageError,
  });
}

final class LoginObscureTextChanged extends LoginState {
  final bool obscureText;

  LoginObscureTextChanged({
    required this.obscureText,
  });
}