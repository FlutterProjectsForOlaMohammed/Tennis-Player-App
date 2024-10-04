part of 'get_user_location_bloc.dart';

sealed class GetUserLocationState extends Equatable {
  const GetUserLocationState();

  @override
  List<Object> get props => [];
}

final class GetUserLocationInitial extends GetUserLocationState {}

final class GetUserLocationLoading extends GetUserLocationState {}

final class GetUserLocationFailure extends GetUserLocationState {
  final String message;

  const GetUserLocationFailure({required this.message});
}

final class GetUserLocationSuccess extends GetUserLocationState {
  final List<double> position;

  const GetUserLocationSuccess({required this.position});
}
