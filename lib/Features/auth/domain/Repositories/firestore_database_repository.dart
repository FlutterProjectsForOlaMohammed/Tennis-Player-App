import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

abstract class FirestoreDatabaseRepository {
  Future<Either<Failure, UserEntity>> getUserInfo({required String email});
  Future<Either<Failure, Unit>> addNewUser({required UserEntity user});
}
