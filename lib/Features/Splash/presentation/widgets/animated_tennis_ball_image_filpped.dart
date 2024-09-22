import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:tennis_player_app/Features/Splash/presentation/widgets/tennis_ball_image_filpped.dart';

class AnimatedTennisBallImageFilpped extends StatelessWidget {
  const AnimatedTennisBallImageFilpped({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(
        begin: getStartPointForTennisImage(context),
        end: Offset(
          MediaQuery.sizeOf(context).width / (6),
          MediaQuery.sizeOf(context).height / (9),
        ),
      ),
      duration: const Duration(seconds: 2),
      builder: (BuildContext context, Offset value, Widget? child) {
        return TennisBallImageFlipped(
          value: value,
        );
      },
    );
  }
}
