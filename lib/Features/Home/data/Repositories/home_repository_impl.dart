import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding_platform_interface/src/models/location.dart' as loc;
import 'package:geolocator/geolocator.dart';
import 'package:tennis_player_app/Features/Home/data/data%20source/ai_prediction_data_source.dart';
import 'package:tennis_player_app/Features/Home/data/data%20source/get_weather_data_source.dart';
import 'package:tennis_player_app/Features/Home/data/models/weather_model/weather_model.dart';
import 'package:tennis_player_app/Features/Home/domain/Repositories/home_repository.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/common/data%20source/firebase_firestore_data_source.dart';
import 'package:tennis_player_app/core/common/enities/weather_enitiy.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseFirestoreDataSource firebaseFirestoreDataSource;
  final GetWeatherDataSource getWeatherDataSource;
  final AiPredictionDataSource aiPredictionDataSource;
  HomeRepositoryImpl(
      {required this.aiPredictionDataSource,
      required this.getWeatherDataSource,
      required this.firebaseFirestoreDataSource});
  @override
  Future<Either<Failure, UserEntity>> getUserInfo(
      {required String email}) async {
    return await firebaseFirestoreDataSource.getUserInfo(email: email);
  }

  @override
  Future<Either<Failure, List<WeatherEnitiy>>> getWeatherData(
      {required String location}) async {
    Either<Failure, WeatherModel> response =
        await getWeatherDataSource.getWeatherData(location: location);
    return response.fold((failure) {
      return Left(failure);
    }, (weather) {
      return Right(
        WeatherEnitiy.convertToWeatherEnitiy(weather),
      );
    });
  }

  @override
  Future<Either<Failure, List<double>>> getCoordinatesFromAddress(
      {required String location}) async {
    try {
      List<loc.Location> locations = await locationFromAddress(location);
      double latitude = locations.first.latitude;
      double longitude = locations.first.longitude;
      return Right([latitude, longitude]);
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<double>>> getUserLocation() async {
    try {
      late List<double> latLon;
      Position position = await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.best),
      );
      latLon = [position.latitude, position.longitude];
      return Right(latLon);
    } on Exception catch (e) {
      return Left(
        UnexpectedFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, int>> aiPrediction(List<int> features) async {
    Either<Failure, int> response =
        await aiPredictionDataSource.getPrediction(features: features);
    return response.fold((failure) {
      return Left(failure);
    }, (predict) {
      return Right(predict);
    });
  }
}
