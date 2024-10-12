part of 'get_user_location_bloc.dart';

sealed class GetUserLocationEvent extends Equatable {
  const GetUserLocationEvent();

  @override
  List<Object> get props => [];
}

class GetLocationEvent extends GetUserLocationEvent {
  final String? userLocation;

  const GetLocationEvent({this.userLocation});
}
