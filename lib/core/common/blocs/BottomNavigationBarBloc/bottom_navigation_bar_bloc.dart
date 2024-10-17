import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(NavigateToWeatherDeteminationState()) {
    on<BottomNavigationBarEvent>((event, emit) {
      if (event is NavigateToWeatherDeterminationEvent) {
        emit(NavigateToWeatherDeteminationState());
      } else if (event is NavigateToFavoriteEvent) {
        emit(NavigateToFavoriteState());
      } else if (event is NavigateToProfileEvent) {
        emit(NavigateToProfileState());
      } else if (event is NavigateToWatherBodyEvent) {
        emit(NavigateToWeatherBodyState());
      }
    });
  }
}
