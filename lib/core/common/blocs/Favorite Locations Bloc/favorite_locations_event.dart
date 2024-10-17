part of 'favorite_locations_bloc.dart';

sealed class FavoriteLocationsEvent extends Equatable {
  const FavoriteLocationsEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteLocationsEvent extends FavoriteLocationsEvent {
  final String email;
  const GetFavoriteLocationsEvent(this.email);
}

class AddFavoriteLocationsEvent extends FavoriteLocationsEvent {
  final WeatherEnitiy weatherEnitiy;
  final String email;
  const AddFavoriteLocationsEvent(this.email, {required this.weatherEnitiy});
}

class DeleteFavoriteLocationEvent extends FavoriteLocationsEvent {
  final LocationEnitiy location;
  final String email;
  const DeleteFavoriteLocationEvent(this.email, {required this.location});
}
