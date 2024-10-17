import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_player_app/Features/Profile/domain/Use%20Cases/update_user_info_use_case.dart';
import 'package:tennis_player_app/core/errors/failures.dart';
part 'update_user_info_event.dart';
part 'update_user_info_state.dart';

class UpdateUserInfoBloc
    extends Bloc<UpdateUserInfoEvent, UpdateUserInfoState> {
  final UpdateUserInfoUseCase updateUserInfoUseCase;
  String? fullName, email, password, country, city, phoneNumber;
  UpdateUserInfoBloc(this.updateUserInfoUseCase)
      : super(UpdateUserInfoInitial()) {
    on<UpdateUserInfoEvent>(
      (event, emit) async {
        if (event is UpdateUserEvent) {
          emit(UpdateUserInfoLoading());
          Either<Failure, Unit> user = await updateUserInfoUseCase
              .updateUserInfo(email: event.email, body: event.body);
          return user.fold((failure) {
            emit(
              UpdateUserInfoFailure(message: failure.message),
            );
          }, (success) async {
            fullName = null;
            email = null;
            phoneNumber = null;
            city = null;
            country = null;
            password = null;
            emit(
              UpdateUserInfoSuccess(),
            );
          });
        }
      },
    );
  }
}
