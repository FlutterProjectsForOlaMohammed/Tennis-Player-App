import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/AI%20Prediction%20Bloc/ai_prediction_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/city_weather_grid_view.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/days_container.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/prediction_icon.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/weather_container.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';
import 'package:tennis_player_app/core/common/enities/weather_enitiy.dart';
import 'package:tennis_player_app/core/di/service_locator.dart';

class GetWeatherSuccessBody extends StatelessWidget {
  const GetWeatherSuccessBody({
    super.key,
    required this.weatherData,
    required this.email,
  });
  final List<WeatherEnitiy> weatherData;
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AiPredictionBloc(
        sl(),
      ),
      child: CustomScrollView(
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
                WeatherContainer(weatherData: weatherData, email: email),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          CityWeatherGridView(weatherData: weatherData),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          PredictionIcon(
            weatherEnitiy: weatherData[0],
          ),
        ],
      ),
    );
  }
}
