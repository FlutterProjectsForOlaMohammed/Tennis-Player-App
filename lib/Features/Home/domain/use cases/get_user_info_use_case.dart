import 'package:dartz/dartz.dart';
import 'package:tennis_player_app/Features/Home/domain/Repositories/home_repository.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/errors/failures.dart';

class GetUserInfoUseCase {
  final HomeRepository homeRepository;

  GetUserInfoUseCase({required this.homeRepository});
  Future<Either<Failure, UserEntity>> getUserInfo(
      {required String email}) async {
    return await homeRepository.getUserInfo(email: email);
  }
}
