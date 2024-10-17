import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Home/domain/Repositories/home_repository.dart';
import 'package:tennis_player_app/core/common/enities/weather_enitiy.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class GetForcastWeatherUseCase {
  final HomeRepository homeRepository;

  GetForcastWeatherUseCase({required this.homeRepository});
  Future<Either<Failure, List<WeatherEnitiy>>> getWeather(
      {required String location}) async {
    return await homeRepository.getWeatherData(location: location);
  }
}
