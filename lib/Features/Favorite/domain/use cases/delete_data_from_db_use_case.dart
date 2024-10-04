import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/Features/Favorite/domain/repositories/fav_repository.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class DeleteDataFromDbUseCase {
  final FavRepository favRepository;

  DeleteDataFromDbUseCase({required this.favRepository});

  Future<Either<Failure, Unit>> deleteDataFromDataBase(
      {required LocationEnitiy location}) async {
    return await favRepository.deleteLocationFromDB(location: location);
  }
}
