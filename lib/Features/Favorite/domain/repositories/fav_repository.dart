import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

abstract class FavRepository {
  Future<Either<Failure, Unit>> deleteLocationFromDB(
      {required LocationEnitiy location});
  Future<Either<Failure, List<LocationEnitiy>>> getLocationFromDB();
  Future<Either<Failure, Unit>> addDataToDB({required LocationEnitiy location});
}
