import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

abstract class FirebaseFirestoreDataSource {
  Future<Either<Failure, Unit>> addNewUser({required UserEntity user});
  Future<Either<Failure, UserEntity>> getUserInfo({required String email});
}

class FirebaseFirestoreDataSourceImpl implements FirebaseFirestoreDataSource {
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
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    try {
      QuerySnapshot doc = await users.where('email', isEqualTo: email).get();
      if (doc.docs.isNotEmpty) {
        Map<String, dynamic> usersData =
            doc.docs.first.data() as Map<String, dynamic>;
        UserEntity firstUserData = UserEntity(
          fullName: usersData['fullName'],
          email: usersData["email"],
          password: usersData["password"],
          phoneNumber: usersData['phoneNumber'],
          country: usersData['country'],
          city: usersData["city"],
        );
        return Right(firstUserData);
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
