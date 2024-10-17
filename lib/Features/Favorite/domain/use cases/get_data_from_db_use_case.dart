import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/Features/Favorite/domain/repositories/fav_repository.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class GetDataFromDbUseCase {
  final FavRepository favRepository;

  GetDataFromDbUseCase({required this.favRepository});

  Future<Either<Failure, List<LocationEnitiy>>> getDataFromDataBase(
      {required String email}) async {
    return await favRepository.getLocationFromDB(email: email);
  }
}
