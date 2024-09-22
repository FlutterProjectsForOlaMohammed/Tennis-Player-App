import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/Splash/presentation/widgets/animated_tennis_ball_image.dart';
import 'package:tennis_player_app/Features/Splash/presentation/widgets/animated_tennis_ball_image_filpped.dart';
import 'package:tennis_player_app/core/utils/app_assets.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff182A58),
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imagesSplashViewBackground,
            fit: BoxFit.cover,
          ),
          const AnimatedTennisBallImage(),
          const AnimatedTennisBallImageFilpped(),
          const Center(
            child: Text(
              "Tennis Player",
              style: TextStyle(
                color: (Colors.white),
                fontSize: 32,
                fontFamily: "Agbalumo",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Offset getStartPointForTennisImage(BuildContext context) {
  return Offset(
    MediaQuery.sizeOf(context).width / 3,
    MediaQuery.sizeOf(context).height / 2.5,
  );
}
