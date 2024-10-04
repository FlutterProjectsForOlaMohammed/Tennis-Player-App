import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_user_location_use_case.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

part 'get_user_location_event.dart';
part 'get_user_location_state.dart';

class GetUserLocationBloc
    extends Bloc<GetUserLocationEvent, GetUserLocationState> {
  final GetUserLocationUseCase getUserLocationUseCase;
  GetUserLocationBloc(this.getUserLocationUseCase)
      : super(GetUserLocationInitial()) {
    on<GetUserLocationEvent>((event, emit) async {
      if (event is GetLocationEvent) {
        emit(GetUserLocationLoading());
        Either<Failure, List<double>> response = await getUserLocationUseCase
            .getUserLocationUseCase(location: event.userLocation);
        return response.fold(
          (failure) {
            emit(
              GetUserLocationFailure(message: failure.message),
            );
          },
          (location) {
            emit(
              GetUserLocationSuccess(position: location),
            );
          },
        );
      }
    });
  }
}
