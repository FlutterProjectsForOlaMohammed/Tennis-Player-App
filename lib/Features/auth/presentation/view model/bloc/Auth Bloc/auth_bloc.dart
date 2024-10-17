import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/add_new_user_to_firebase_db_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/login_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/register_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/reset_password_use_case.dart';
import 'package:tennis_player_app/core/errors/failures.dart';
import 'package:tennis_player_app/core/network/check_internet.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final AddNewUserToFirebaseDbUseCase addNewUserToFirebaseDbUseCase;
  String? fullName, email, password, country, city, phoneNumber;

  bool absorbPointer = false;
  AuthBloc(
    this.loginUseCase,
    this.registerUseCase,
    this.resetPasswordUseCase,
    this.addNewUserToFirebaseDbUseCase,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState());
        if (await CheckInternet.checkInternet()) {
          absorbPointer = true;
          Either<Failure, Unit> response = await loginUseCase.login(
              email: event.email, password: event.password);
          return response.fold((failure) {
            absorbPointer = false;
            emit(
              LoginFailureState(message: failure.message),
            );
          }, (success) {
            absorbPointer = false;
            emit(LoginSuccessState(
                email: event.email, password: event.password));
          });
        }
        emit(
          LoginFailureState(
              message: "No Internet ,Check Your Internet Connectivity ..."),
        );
      } else if (event is RegisterEvent) {
        emit(RegisterLoadingState());
        if (await CheckInternet.checkInternet()) {
          absorbPointer = true;
          Either<Failure, Unit> response = await registerUseCase.register(
            fullName: event.fullName,
            phoneNumber: event.phoneNumber,
            city: event.city,
            country: event.country,
            email: event.email,
            password: event.password,
          );

          return response.fold((failure) {
            absorbPointer = false;
            emit(
              RegisterFailureState(message: failure.message),
            );
          }, (success) async {
            Either<Failure, Unit> addUsertoDB =
                await addNewUserToFirebaseDbUseCase.add(
              fullName: event.fullName,
              email: event.email,
              password: event.password,
              phoneNumber: event.phoneNumber,
              country: event.country,
              city: event.city,
            );
            return addUsertoDB.fold((failure) {
              absorbPointer = false;
              emit(
                RegisterFailureState(message: failure.message),
              );
            }, (success) {
              emit(
                RegisterSuccessState(email: event.email),
              );
            });
          });
        }
        emit(
          RegisterFailureState(
              message: "No Internet ,Check Your Internet Connectivity ..."),
        );
      } else if (event is ResetPasswordEvent) {
        emit(ResetPasswordLoadingState());
        if (await CheckInternet.checkInternet()) {
          absorbPointer = true;
          Either<Failure, Unit> response =
              await resetPasswordUseCase.resetPassword(
            email: event.email,
          );
          return response.fold((failure) {
            absorbPointer = false;
            emit(
              ResetPasswordFailureState(message: failure.message),
            );
          }, (success) {
            absorbPointer = false;
            emit(
              ResetPasswordSuccessState(),
            );
          });
        }
        emit(
          ResetPasswordFailureState(
              message: "No Internet ,Check Your Internet Connectivity ..."),
        );
      }
    });
  }
}
