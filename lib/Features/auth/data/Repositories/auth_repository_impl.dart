import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/data/data%20sources/firebase_auth_data_source.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/auth_repository.dart';
import 'package:tennis_player_app/core/common/data%20source/firebase_firestore_data_source.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource authDataSource;
  final FirebaseFirestoreDataSource firebaseFirestoreDataSource;
  const AuthRepositoryImpl(this.firebaseFirestoreDataSource,
      {required this.authDataSource});
  @override
  Future<Either<Failure, Unit>> loginOperation(
      {required UserEntity user}) async {
    return await authDataSource.loginOperation(user: user);
  }

  @override
  Future<Either<Failure, Unit>> registerOperation({
    required UserEntity user,
  }) async {
    return await authDataSource.registerOperation(user: user);
  }

  @override
  Future<Either<Failure, Unit>> resetPasswordOperation(
      {required UserEntity user}) async {
    return await authDataSource.resetPasswordOperation(user: user);
  }

  @override
  Future<Either<Failure, Unit>> addNewUserToFirebase(
      {required UserEntity user}) async {
    return await firebaseFirestoreDataSource.addNewUser(user: user);
  }
}
