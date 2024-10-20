import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/core/common/blocs/Favorite%20Locations%20Bloc/favorite_locations_bloc.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/core/common/blocs/BottomNavigationBarBloc/bottom_navigation_bar_bloc.dart';
import 'package:tennis_player_app/core/common/blocs/GetWeatherBloc/get_weather_bloc.dart';

class FavoriteLocationListTileActions extends StatelessWidget {
  const FavoriteLocationListTileActions({
    super.key,
    required this.cityName,
    required this.lat,
    required this.lon,
    required this.email,
  });

  final String cityName;
  final String lat;
  final String lon;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            BlocProvider.of<FavoriteLocationsBloc>(context).add(
              DeleteFavoriteLocationEvent(
                email,
                location:
                    LocationEnitiy(location: cityName, lat: lat, lon: lon),
              ),
            );
          },
          padding: EdgeInsets.zero,
          icon: const Icon(
            Icons.delete,
            color: Color.fromRGBO(95, 1, 1, 1),
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            BlocProvider.of<GetWeatherBloc>(context).add(
              GetForcastWeatherEvent(location: "$lat,$lon"),
            );
            BlocProvider.of<BottomNavigationBarBloc>(context)
                .add(NavigateToWatherBodyEvent());
          },
          icon: const Icon(
            Icons.send_rounded,
          ),
        ),
      ],
    );
  }
}
