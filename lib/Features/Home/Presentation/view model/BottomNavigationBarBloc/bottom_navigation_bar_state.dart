part of 'bottom_navigation_bar_bloc.dart';

sealed class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();

  @override
  List<Object> get props => [];
}

final class NavigateToProfileState extends BottomNavigationBarState {}

final class NavigateToFavoriteState extends BottomNavigationBarState {}

final class NavigateToWeatherBodyState extends BottomNavigationBarState {}

final class NavigateToWeatherDeteminationState
    extends BottomNavigationBarState {}
