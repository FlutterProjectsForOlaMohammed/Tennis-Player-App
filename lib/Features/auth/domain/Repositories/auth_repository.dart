import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> loginOperation({required UserEntity user});

  Future<Either<Failure, Unit>> registerOperation({required UserEntity user});

  Future<Either<Failure, Unit>> resetPasswordOperation(
      {required UserEntity user});
}
