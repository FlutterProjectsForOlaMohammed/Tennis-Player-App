part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginFailureState extends AuthState {
  final String message;

  LoginFailureState({
    required this.message,
  });
}

class RegisterSuccessState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterFailureState extends AuthState {
  final String message;

  RegisterFailureState({
    required this.message,
  });
}

class ResetPasswordSuccessState extends AuthState {
  final String message = "Your Password is Updated Succesfully";
}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordFailureState extends AuthState {
  final String message;

  ResetPasswordFailureState({
    required this.message,
  });
}
