part of 'get_user_info_bloc.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoFailure extends GetUserInfoState {
  final String message;

  GetUserInfoFailure({required this.message});
}

final class GetUserInfoSuccess extends GetUserInfoState {
  final UserEntity userEntity;

  GetUserInfoSuccess({required this.userEntity});
}
