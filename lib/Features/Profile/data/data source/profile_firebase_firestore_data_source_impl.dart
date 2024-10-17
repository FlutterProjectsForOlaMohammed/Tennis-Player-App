import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/common/Functions/get_user_info_from_firebase_db.dart';
import 'package:tennis_player_app/core/common/data%20source/firebase_firestore_data_source.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class ProfileFirebaseFirestoreDataSourceImpl
    implements FirebaseFirestoreDataSource {
  final GetUserInfoFromFirebaseDb getUserInfoFromFirebaseDb;

  ProfileFirebaseFirestoreDataSourceImpl(
      {required this.getUserInfoFromFirebaseDb});
  @override
  Future<Either<Failure, Unit>> addNewUser({required UserEntity user}) {
    throw Exception("Not Used");
  }

  @override
  Future<Either<Failure, UserEntity>> getUserInfo(
      {required String email}) async {
    throw Exception("Not Used");
  }

  @override
  Future<Either<Failure, Unit>> updateUserInfo(
      {required String email, required Map<String, dynamic> body}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');

    QuerySnapshot doc = await users.where('email', isEqualTo: email).get();
    try {
      if (doc.docs.isNotEmpty) {
        String userID = doc.docs.first.id;
        await users.doc(userID).update(body);
        return const Right(unit);
      } else {
        return const Left(
          FirebaseFirestoreFailure(message: "No user found with that email."),
        );
      }
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
}
