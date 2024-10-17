part of 'get_weather_bloc.dart';

sealed class GetWeatherEvent extends Equatable {
  const GetWeatherEvent();

  @override
  List<Object> get props => [];
}

class GetForcastWeatherEvent extends GetWeatherEvent {
  final String location;

  const GetForcastWeatherEvent({required this.location});
}
