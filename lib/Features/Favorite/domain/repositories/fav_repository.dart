import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

abstract class FavRepository {
  Future<Either<Failure, Unit>> deleteLocationFromDB(
      {required LocationEnitiy location, required String email});
  Future<Either<Failure, List<LocationEnitiy>>> getLocationFromDB(
      {required String email});
  Future<Either<Failure, Unit>> addDataToDB(
      {required LocationEnitiy location, required String email});
}
