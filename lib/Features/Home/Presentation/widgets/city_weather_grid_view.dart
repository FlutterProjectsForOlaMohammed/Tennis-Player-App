import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/city_weather_item.dart';
import 'package:tennis_player_app/core/common/enities/weather_enitiy.dart';

class CityWeatherGridView extends StatelessWidget {
  const CityWeatherGridView({
    super.key,
    required this.weatherData,
  });
  final List<WeatherEnitiy> weatherData;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.2,
      crossAxisCount: 2,
      children: [
        CityWeatherItem(
            title: "MIN Temp in Celsius ",
            subTitle: "${weatherData[0].mintempC}"),
        CityWeatherItem(
            title: "MAX Temp in Celsius ",
            subTitle: "${weatherData[0].maxtempC}"),
        CityWeatherItem(
            title: "MAX WIND", subTitle: "${weatherData[0].maxwindKPH} km/h"),
        CityWeatherItem(
            title: "Avg Humidity", subTitle: "${weatherData[0].avghumidity}%"),
      ],
    );
  }
}
