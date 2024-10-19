import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/common/Functions/get_user_info_from_firebase_db.dart';
import 'package:tennis_player_app/core/common/data%20source/firebase_firestore_data_source.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class AuthFirebaseFirestoreDataSourceImpl
    implements FirebaseFirestoreDataSource {
  final GetUserInfoFromFirebaseDb getUserInfoFromFirebaseDb;

  AuthFirebaseFirestoreDataSourceImpl(
      {required this.getUserInfoFromFirebaseDb});
  @override
  Future<Either<Failure, Unit>> addNewUser({required UserEntity user}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    try {
      await users.add(
        {
          'fullName': user.fullName,
          'email': user.email,
          'password': user.password,
          'country': user.country,
          'city': user.city,
          'phoneNumber': user.phoneNumber,
        },
      );
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(
        FirebaseFirestoreFailure.handleError(e),
      );
    } catch (e) {
      return Left(
        UnexpectedFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInfo(
      {required String email}) async {
    throw Exception("Not Used");
  }

  @override
  Future<Either<Failure, Unit>> updateUserInfo({
    required String email,
    required Map<String, dynamic> body,
  }) async {
    throw Exception("Not Used");
  }
}
