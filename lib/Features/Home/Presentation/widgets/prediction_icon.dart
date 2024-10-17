import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/AI%20Prediction%20Bloc/ai_prediction_bloc.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';
import 'package:tennis_player_app/core/common/enities/weather_enitiy.dart';
import 'package:tennis_player_app/core/widgets/show_dialog.dart';

class PredictionIcon extends StatelessWidget {
  const PredictionIcon({
    super.key,
    required this.weatherEnitiy,
  });
  final WeatherEnitiy weatherEnitiy;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.1),
          ),
          onPressed: () {
            BlocProvider.of<AiPredictionBloc>(context).add(
              GetPredictionEvent(weatherEnitiy: weatherEnitiy),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.psychology_alt_rounded,
                size: 32,
                color: Colors.yellow,
              ),
              const SizedBox(
                width: 8,
              ),
              BlocConsumer<AiPredictionBloc, AiPredictionState>(
                listener: (context, state) {
                  if (state is AiPredictionFailure) {
                    showingDialog(
                      context,
                      title: state.message,
                      headerIcon: Icons.error_outline_rounded,
                    );
                  } else if (state is AiPredictionSuccess) {
                    showingDialog(
                      context,
                      title: (state.prediction == 1)
                          ? "You can train at this location."
                          : "You can not train at this location.",
                      headerIcon: (state.prediction == 1)
                          ? Icons.check_circle_outline_rounded
                          : Icons.error_outline_rounded,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AiPredictionLoading) {
                    return const CupertinoActivityIndicator();
                  } else {
                    return ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          colors: [
                            Colors.blue,
                            Color.fromARGB(255, 244, 219, 54),
                            Colors.teal,
                          ],
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        );
                      },
                      child: Text(
                        "AI Prediction",
                        style: TextStyle(
                          fontSize:
                              responsiveFontSize(context, baseFontSize: 28),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
