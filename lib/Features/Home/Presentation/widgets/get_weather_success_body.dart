import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/city_weather_grid_view.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/days_container.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/weather_container.dart';
import 'package:tennis_player_app/Features/Home/domain/enities/weather_enitiy.dart';
import 'package:tennis_player_app/core/Functions/reponsive_font_size.dart';

class GetWeatherSuccessBody extends StatelessWidget {
  const GetWeatherSuccessBody({
    super.key,
    required this.weatherData,
  });
  final List<WeatherEnitiy> weatherData;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              DaysContainer(daysWeather: weatherData),
              const SizedBox(
                height: 20,
              ),
              Text(
                weatherData[0].cityName,
                style: TextStyle(
                    fontSize: responsiveFontSize(context, baseFontSize: 32),
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              WeatherContainer(weatherData: weatherData),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        CityWeatherGridView(weatherData: weatherData),
      ],
    );
  }
}
