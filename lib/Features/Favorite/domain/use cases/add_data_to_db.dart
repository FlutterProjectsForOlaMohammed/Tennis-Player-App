import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/Features/Favorite/domain/repositories/fav_repository.dart';
import 'package:tennis_player_app/core/common/enities/weather_enitiy.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class AddDataToDbUseCase {
  final FavRepository favRepository;

  AddDataToDbUseCase({required this.favRepository});

  Future<Either<Failure, Unit>> addData(
      {required WeatherEnitiy weather, required String email}) async {
    LocationEnitiy locationEnitiy = LocationEnitiy(
        location: weather.cityName, lat: weather.lat, lon: weather.lon);
    return await favRepository.addDataToDB(
        location: locationEnitiy, email: email);
  }
}
