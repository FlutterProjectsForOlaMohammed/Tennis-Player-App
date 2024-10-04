import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_user_info_use_case.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

part 'get_user_info_event.dart';
part 'get_user_info_state.dart';

class GetUserInfoBloc extends Bloc<GetUserInfoEvent, GetUserInfoState> {
  final GetUserInfoUseCase getUserInfoUseCase;
  GetUserInfoBloc(this.getUserInfoUseCase) : super(GetUserInfoInitial()) {
    on<GetUserInfoEvent>((event, emit) async {
      if (event is GetUserEvent) {
        emit(GetUserInfoLoading());
        Either<Failure, UserEntity> user =
            await getUserInfoUseCase.getUserInfo(email: event.email);
        return user.fold((failure) {
          emit(
            GetUserInfoFailure(message: failure.message),
          );
        }, (success) {
          emit(
            GetUserInfoSuccess(userEntity: success),
          );
        });
      }
    });
  }
}
