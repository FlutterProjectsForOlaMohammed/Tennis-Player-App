import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Favorite/data/data%20sources/db_data_source.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/Features/Favorite/domain/repositories/fav_repository.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class FavRepositoryImpl implements FavRepository {
  final DBDataSource db;

  FavRepositoryImpl({required this.db});
  @override
  Future<Either<Failure, Unit>> deleteLocationFromDB(
      {required LocationEnitiy location, required String email}) async {
    return await db.deleteDataFromDB(location: location, email: email);
  }

  @override
  Future<Either<Failure, List<LocationEnitiy>>> getLocationFromDB(
      {required String email}) async {
    return await db.getDataFromDB(email: email);
  }

  @override
  Future<Either<Failure, Unit>> addDataToDB(
      {required LocationEnitiy location, required String email}) async {
    return await db.addDataFromDB(location: location, email: email);
  }
}
