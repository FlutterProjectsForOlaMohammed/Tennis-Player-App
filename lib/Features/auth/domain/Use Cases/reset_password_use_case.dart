import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/Features/auth/domain/Repositories/auth_repository.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class ResetPasswordUseCase {
  final AuthRepository authRepository;

  const ResetPasswordUseCase({required this.authRepository});
  Future<Either<Failure, Unit>> resetPassword({
    required String email,
  }) async {
    UserEntity user = UserEntity(
      fullName: "",
      email: email,
      password: "",
      phoneNumber: "",
      country: "",
      city: "",
    );
    return await authRepository.resetPasswordOperation(user: user);
  }
}
