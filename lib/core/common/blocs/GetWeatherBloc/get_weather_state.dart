part of 'get_weather_bloc.dart';

sealed class GetWeatherState extends Equatable {
  const GetWeatherState();

  @override
  List<Object> get props => [];
}

final class GetWeatherInitial extends GetWeatherState {}

final class GetWeatherLoading extends GetWeatherState {}

final class GetWeatherSuccess extends GetWeatherState {
  final List<WeatherEnitiy> weatherData;

  const GetWeatherSuccess({required this.weatherData});
}

final class GetWeatherFailure extends GetWeatherState {
  final String message;

  const GetWeatherFailure({required this.message});
}
