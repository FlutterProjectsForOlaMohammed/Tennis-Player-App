import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Profile/domain/Repositories/profile_repository.dart';
import 'package:tennis_player_app/core/common/data%20source/firebase_firestore_data_source.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final FirebaseFirestoreDataSource firebaseFirestoreDataSource;

  ProfileRepositoryImpl({required this.firebaseFirestoreDataSource});
  @override
  Future<Either<Failure, Unit>> updateProfileData({
    required String email,
    required Map<String, dynamic> body,
  }) async {
    return await firebaseFirestoreDataSource.updateUserInfo(
        email: email, body: body);
  }
}
