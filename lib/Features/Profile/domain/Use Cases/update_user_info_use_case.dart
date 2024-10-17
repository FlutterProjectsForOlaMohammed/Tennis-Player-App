import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Profile/domain/Repositories/profile_repository.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class UpdateUserInfoUseCase {
  final ProfileRepository profileRepository;

  UpdateUserInfoUseCase({
    required this.profileRepository,
  });
  Future<Either<Failure, Unit>> updateUserInfo(
      {required String email, required Map<String, dynamic> body}) async {
    return await profileRepository.updateProfileData(email: email, body: body);
  }
}
