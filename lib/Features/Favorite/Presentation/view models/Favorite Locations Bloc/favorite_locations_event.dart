part of 'favorite_locations_bloc.dart';

sealed class FavoriteLocationsEvent extends Equatable {
  const FavoriteLocationsEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteLocationsEvent extends FavoriteLocationsEvent {}

class AddFavoriteLocationsEvent extends FavoriteLocationsEvent {
  final WeatherEnitiy weatherEnitiy;

  const AddFavoriteLocationsEvent({required this.weatherEnitiy});
}

class DeleteFavoriteLocationEvent extends FavoriteLocationsEvent {
  final LocationEnitiy location;

  const DeleteFavoriteLocationEvent({required this.location});
}
