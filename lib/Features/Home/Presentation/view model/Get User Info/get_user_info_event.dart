part of 'get_user_info_bloc.dart';

sealed class GetUserInfoEvent extends Equatable {
  const GetUserInfoEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends GetUserInfoEvent {
  final String email;

  const GetUserEvent({required this.email});
}
