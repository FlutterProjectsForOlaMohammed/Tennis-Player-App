import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/common/enities/weather_enitiy.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserEntity>> getUserInfo({required String email});
  Future<Either<Failure, List<WeatherEnitiy>>> getWeatherData({
    required String location,
  });
  Future<Either<Failure, List<double>>> getUserLocation();
  Future<Either<Failure, List<double>>> getCoordinatesFromAddress({
    required String location,
  });
  Future<Either<Failure, int>> aiPrediction(List<int> features);
}
