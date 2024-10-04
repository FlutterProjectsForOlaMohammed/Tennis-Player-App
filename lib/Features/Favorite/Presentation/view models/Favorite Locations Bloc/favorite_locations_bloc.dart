import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/Features/Favorite/domain/use%20cases/add_data_to_db.dart';
import 'package:tennis_player_app/Features/Favorite/domain/use%20cases/delete_data_from_db_use_case.dart';
import 'package:tennis_player_app/Features/Favorite/domain/use%20cases/get_data_from_db_use_case.dart';
import 'package:tennis_player_app/Features/Home/domain/enities/weather_enitiy.dart';
import 'package:tennis_player_app/core/errors/failures.dart';
part 'favorite_locations_event.dart';
part 'favorite_locations_state.dart';

class FavoriteLocationsBloc
    extends Bloc<FavoriteLocationsEvent, FavoriteLocationsState> {
  final GetDataFromDbUseCase getDataFromDbUseCase;
  final DeleteDataFromDbUseCase deleteDataFromDbUseCase;
  final AddDataToDbUseCase addDataToDbUseCase;
  FavoriteLocationsBloc(this.getDataFromDbUseCase, this.deleteDataFromDbUseCase,
      this.addDataToDbUseCase)
      : super(FavoriteLocationsInitial()) {
    on<FavoriteLocationsEvent>((event, emit) async {
      if (event is GetFavoriteLocationsEvent) {
        emit(GetFavoriteLocationsLoading());
        return await getLocationsFromDBMethod(emit);
      } else if (event is DeleteFavoriteLocationEvent) {
        emit(GetFavoriteLocationsLoading());
        Either<Failure, Unit> response = await deleteDataFromDbUseCase
            .deleteDataFromDataBase(location: event.location);
        return response.fold((failure) {
          emit(
            GetFavoriteLocationsFailure(message: failure.message),
          );
        }, (success) async {
          return await getLocationsFromDBMethod(emit);
        });
      } else if (event is AddFavoriteLocationsEvent) {
        emit(GetFavoriteLocationsLoading());
        Either<Failure, Unit> response =
            await addDataToDbUseCase.addData(weather: event.weatherEnitiy);
        return response.fold((failure) {
          emit(
            GetFavoriteLocationsFailure(message: failure.message),
          );
        }, (success) async {
          return await getLocationsFromDBMethod(emit);
        });
      }
    });
  }

  Future<void> getLocationsFromDBMethod(
      Emitter<FavoriteLocationsState> emit) async {
    Either<Failure, List<LocationEnitiy>> response =
        await getDataFromDbUseCase.getDataFromDataBase();
    return response.fold((failure) {
      emit(
        GetFavoriteLocationsFailure(message: failure.message),
      );
    }, (success) {
      emit(
        GetFavoriteLocationsSuccess(locations: success),
      );
    });
  }
}
