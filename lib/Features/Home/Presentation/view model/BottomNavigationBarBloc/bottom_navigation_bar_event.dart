part of 'bottom_navigation_bar_bloc.dart';

sealed class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent();

  @override
  List<Object> get props => [];
}

class NavigateToProfileEvent extends BottomNavigationBarEvent {}

class NavigateToFavoriteEvent extends BottomNavigationBarEvent {}

class NavigateToWatherBodyEvent extends BottomNavigationBarEvent {}

class NavigateToWeatherDeterminationEvent extends BottomNavigationBarEvent {}
