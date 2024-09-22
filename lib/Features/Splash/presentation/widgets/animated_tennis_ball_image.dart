import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:tennis_player_app/Features/Splash/presentation/widgets/tennis_ball_image.dart';

class AnimatedTennisBallImage extends StatelessWidget {
  const AnimatedTennisBallImage({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(
        begin: getStartPointForTennisImage(context),
        end: Offset(
          MediaQuery.sizeOf(context).width / 2.1,
          MediaQuery.sizeOf(context).height / 1.4,
        ),
      ),
      duration: const Duration(seconds: 2),
      builder: (BuildContext context, Offset value, Widget? child) {
        return TennisBallImage(
          value: value,
        );
      },
    );
  }
}
