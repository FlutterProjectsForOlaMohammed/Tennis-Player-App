part of 'favorite_locations_bloc.dart';

sealed class FavoriteLocationsState extends Equatable {
  const FavoriteLocationsState();

  @override
  List<Object> get props => [];
}

final class FavoriteLocationsInitial extends FavoriteLocationsState {}

final class GetFavoriteLocationsSuccess extends FavoriteLocationsState {
  final List<LocationEnitiy> locations;

  const GetFavoriteLocationsSuccess({required this.locations});
}

final class GetFavoriteLocationsLoading extends FavoriteLocationsState {}

final class GetFavoriteLocationsFailure extends FavoriteLocationsState {
  final String message;

  const GetFavoriteLocationsFailure({required this.message});
}
