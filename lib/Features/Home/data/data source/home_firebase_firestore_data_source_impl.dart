import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/common/Functions/get_user_info_from_firebase_db.dart';
import 'package:tennis_player_app/core/common/data%20source/firebase_firestore_data_source.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class HomeFirebaseFirestoreDataSourceImpl
    implements FirebaseFirestoreDataSource {
  final GetUserInfoFromFirebaseDb getUserInfoFromFirebaseDb;

  HomeFirebaseFirestoreDataSourceImpl(
      {required this.getUserInfoFromFirebaseDb});
  @override
  Future<Either<Failure, Unit>> addNewUser({required UserEntity user}) {
    throw Exception("Not Used");
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInfo(
      {required String email}) async {
    return await getUserInfoFromFirebaseDb.getUserInfo(email: email);
  }

  @override
  Future<Either<Failure, Unit>> updateUserInfo(
      {required String email, required Map<String, dynamic> body}) {
    throw Exception("Not Used");
  }
}
