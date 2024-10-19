part of 'update_user_info_bloc.dart';

sealed class UpdateUserInfoEvent extends Equatable {
  const UpdateUserInfoEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserEvent extends UpdateUserInfoEvent {
  final String email;
  final Map<String, dynamic> body;

  const UpdateUserEvent({required this.email, required this.body});
}
