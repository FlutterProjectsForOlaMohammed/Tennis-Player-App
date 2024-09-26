import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/firestore_database_repository.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/login_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/register_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Use%20Cases/reset_password_use_case.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final FirestoreDatabaseRepository firestoreDatabaseRepository;
  String? fullName, email, password, country, city, phoneNumber;

  bool absorbPointer = false;
  AuthBloc(
    this.loginUseCase,
    this.registerUseCase,
    this.resetPasswordUseCase,
    this.firestoreDatabaseRepository,
  ) : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is LoginEvent) {
          absorbPointer = true;
          emit(LoginLoadingState());
          Either<Failure, Unit> response = await loginUseCase.login(
              email: event.email, password: event.password);
          return response.fold((failure) {
            absorbPointer = false;
            emit(
              LoginFailureState(message: failure.message),
            );
          }, (success) {
            absorbPointer = false;
            emit(LoginSuccessState());
          });
        } else if (event is RegisterEvent) {
          absorbPointer = true;
          emit(RegisterLoadingState());
          Either<Failure, Unit> response = await registerUseCase.register(
            fullName: event.fullName,
            phoneNumber: event.phoneNumber,
            city: event.city,
            country: event.country,
            email: event.email,
            password: event.password,
          );
          UserEntity user = UserEntity(
            fullName: event.fullName,
            email: event.email,
            password: event.password,
            phoneNumber: event.phoneNumber,
            country: event.country,
            city: event.city,
          );

          return response.fold((failure) {
            absorbPointer = false;
            emit(
              RegisterFailureState(message: failure.message),
            );
          }, (success) async {
            Either<Failure, Unit> addUsertoDB =
                await firestoreDatabaseRepository.addNewUser(user: user);
            return addUsertoDB.fold((failure) {
              absorbPointer = false;
              emit(
                RegisterFailureState(message: failure.message),
              );
            }, (success) {
              emit(RegisterSuccessState());
            });
          });
        } else if (event is ResetPasswordEvent) {
          absorbPointer = true;
          emit(ResetPasswordLoadingState());
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
      },
    );
  }
}
