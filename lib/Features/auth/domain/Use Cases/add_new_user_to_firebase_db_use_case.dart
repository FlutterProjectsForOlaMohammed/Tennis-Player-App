import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/auth_repository.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class AddNewUserToFirebaseDbUseCase {
  final AuthRepository authFirestoreDatabaseRepository;

  AddNewUserToFirebaseDbUseCase(
      {required this.authFirestoreDatabaseRepository});
  Future<Either<Failure, Unit>> add(
      {required String fullName,
      required String password,
      required String email,
      required String country,
      required String city,
      required String phoneNumber}) async {
    UserEntity user = UserEntity(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      country: country,
      city: city,
    );

    return await authFirestoreDatabaseRepository.addNewUserToFirebase(
        user: user);
  }
}
