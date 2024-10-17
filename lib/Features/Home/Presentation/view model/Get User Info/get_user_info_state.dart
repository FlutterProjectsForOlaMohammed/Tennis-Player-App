part of 'get_user_info_bloc.dart';

sealed class GetUserInfoState extends Equatable {
  const GetUserInfoState();

  @override
  List<Object> get props => [];
}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoFailure extends GetUserInfoState {
  final String message;

  const GetUserInfoFailure({required this.message});
}

final class GetUserInfoSuccess extends GetUserInfoState {
  final UserEntity userEntity;

  const GetUserInfoSuccess({required this.userEntity});
}
