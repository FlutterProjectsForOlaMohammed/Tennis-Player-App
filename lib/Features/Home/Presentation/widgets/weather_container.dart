import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/view%20models/Favorite%20Locations%20Bloc/favorite_locations_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/favorite_icon.dart';
import 'package:tennis_player_app/Features/Home/domain/enities/weather_enitiy.dart';
import 'package:tennis_player_app/core/Functions/reponsive_font_size.dart';
import 'package:tennis_player_app/core/di/service_locator.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({
    super.key,
    required this.weatherData,
  });

  final List<WeatherEnitiy> weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            weatherData[0].dayStatus,
            style: TextStyle(
              fontSize: responsiveFontSize(context, baseFontSize: 32),
              fontWeight: FontWeight.w700,
              shadows: const [
                Shadow(
                  color: Colors.grey,
                  blurRadius: 15,
                  offset: Offset(2, 2),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 60,
            backgroundImage: CachedNetworkImageProvider(
              weatherData[0].icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              weatherData[0].avgtempC.toString(),
              style: TextStyle(
                  fontSize: responsiveFontSize(context, baseFontSize: 32),
                  fontWeight: FontWeight.w900),
            ),
          ),
          BlocProvider(
            create: (context) => FavoriteLocationsBloc(sl(), sl(), sl()),
            child: FavoriteIcon(
              weatherEnitiy: weatherData[0],
            ),
          )
        ],
      ),
    );
  }
}
