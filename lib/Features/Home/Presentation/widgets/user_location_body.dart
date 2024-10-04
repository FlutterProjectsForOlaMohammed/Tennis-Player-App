import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/GetWeatherBloc/get_weather_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/get_weather_failure_body.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/get_weather_success_body.dart';

class UserLocationBody extends StatelessWidget {
  const UserLocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetWeatherBloc, GetWeatherState>(
        builder: (context, state) {
          if (state is GetWeatherFailure) {
            return GetWeatherFailureBody(
              message: state.message,
            );
          } else if (state is GetWeatherSuccess) {
            return GetWeatherSuccessBody(
              weatherData: state.weatherData,
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }
}
