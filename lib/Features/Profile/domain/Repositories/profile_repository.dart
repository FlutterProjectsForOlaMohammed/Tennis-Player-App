import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Unit>> updateProfileData(
      {required String email, required Map<String, dynamic> body});
}
