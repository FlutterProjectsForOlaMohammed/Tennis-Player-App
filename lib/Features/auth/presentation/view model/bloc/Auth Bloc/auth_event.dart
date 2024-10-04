part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email, password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

class RegisterEvent extends AuthEvent {
  final String email, password, country, city, phoneNumber, fullName;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.country,
    required this.city,
    required this.phoneNumber,
    required this.fullName,
  });
}

class ResetPasswordEvent extends AuthEvent {
  final String email;

  ResetPasswordEvent({
    required this.email,
  });
}
