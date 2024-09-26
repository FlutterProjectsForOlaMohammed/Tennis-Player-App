import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/auth_repository.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  const LoginUseCase({required this.authRepository});
  Future<Either<Failure, Unit>> login(
      {required String email, required String password}) async {
    UserEntity user = UserEntity(
      fullName: "",
      email: email,
      password: password,
      phoneNumber: "",
      country: "",
      city: "",
    );
    return await authRepository.loginOperation(user: user);
  }
}
