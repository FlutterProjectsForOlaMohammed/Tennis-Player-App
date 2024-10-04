part of 'get_user_info_bloc.dart';

@immutable
sealed class GetUserInfoEvent {}

class GetUserEvent extends GetUserInfoEvent {
  final String email;

  GetUserEvent({required this.email});
}
