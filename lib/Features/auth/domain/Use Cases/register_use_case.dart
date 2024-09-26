import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/auth_repository.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  const RegisterUseCase({required this.authRepository});
  Future<Either<Failure, Unit>> register(
      {required String email,
      required String password,
      required String fullName,
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
    return await authRepository.registerOperation(user: user);
  }
}
