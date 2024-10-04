import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_player_app/Features/Home/domain/enities/weather_enitiy.dart';
import 'package:tennis_player_app/Features/Home/domain/use%20cases/get_forcast_weather_use_case.dart';
import 'package:tennis_player_app/core/errors/failures.dart';
import 'package:tennis_player_app/core/network/check_internet.dart';

part 'get_weather_event.dart';
part 'get_weather_state.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  final GetForcastWeatherUseCase getForcastWeatherUseCase;
  GetWeatherBloc(this.getForcastWeatherUseCase) : super(GetWeatherInitial()) {
    on<GetWeatherEvent>(
      (event, emit) async {
        if (event is GetForcastWeatherEvent) {
          emit(GetWeatherLoading());
          if (await CheckInternet.checkInternet()) {
            Either<Failure, List<WeatherEnitiy>> response =
                await getForcastWeatherUseCase.getWeather(
                    location: event.location);
            return response.fold((failure) {
              emit(
                GetWeatherFailure(message: failure.message),
              );
            }, (success) {
              emit(
                GetWeatherSuccess(weatherData: success),
              );
            });
          }
          return emit(
            const GetWeatherFailure(
                message: "No Internet ,Check Your Internet Connectivity ..."),
          );
        }
      },
    );
  }
}
