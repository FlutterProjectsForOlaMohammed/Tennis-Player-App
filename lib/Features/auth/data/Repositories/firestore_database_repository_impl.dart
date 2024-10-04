import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/data/data%20sources/firebase_firestore_data_source.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/firestore_database_repository.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class FirestoreDatabaseRepositoryImpl implements FirestoreDatabaseRepository {
  final FirebaseFirestoreDataSource firebaseFirestoreDataSource;

  const FirestoreDatabaseRepositoryImpl({
    required this.firebaseFirestoreDataSource,
  });
  @override
  Future<Either<Failure, Unit>> addNewUser({required UserEntity user}) async {
    return await firebaseFirestoreDataSource.addNewUser(user: user);
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInfo(
      {required String email}) async {
    return await firebaseFirestoreDataSource.getUserInfo(email: email);
  }
}
