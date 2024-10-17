import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/core/common/blocs/Favorite%20Locations%20Bloc/favorite_locations_bloc.dart';
import 'package:tennis_player_app/Features/Favorite/domain/enities/location_enitiy.dart';
import 'package:tennis_player_app/core/common/enities/weather_enitiy.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.weatherEnitiy,
    required this.email,
  });
  final WeatherEnitiy weatherEnitiy;
  final String email;
  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: AnimatedSwitcher(
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeIn,
          duration: const Duration(milliseconds: 300),
          child: isClicked
              ? IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    size: 28,
                    color: Colors.red,
                  ),
                  key: const ValueKey('favorite'),
                  onPressed: () {
                    LocationEnitiy locationEnitiy = LocationEnitiy(
                        location: widget.weatherEnitiy.cityName,
                        lat: widget.weatherEnitiy.lat,
                        lon: widget.weatherEnitiy.lon);
                    BlocProvider.of<FavoriteLocationsBloc>(context).add(
                      DeleteFavoriteLocationEvent(widget.email,
                          location: locationEnitiy),
                    );
                    _switchBetweenIcons();
                  },
                )
              : IconButton(
                  onPressed: () {
                    BlocProvider.of<FavoriteLocationsBloc>(context).add(
                      AddFavoriteLocationsEvent(widget.email,
                          weatherEnitiy: widget.weatherEnitiy),
                    );
                    _switchBetweenIcons();
                  },
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    size: 28,
                  ),
                  key: const ValueKey('unfavorite'),
                ),
        ),
      ),
    );
  }

  void _switchBetweenIcons() {
    setState(() {
      isClicked = !isClicked;
    });
  }
}
