import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/utils/app_assets.dart';

class TennisBallImageFlipped extends StatelessWidget {
  const TennisBallImageFlipped({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 170,
      child: Transform.flip(
        flipX: true,
        flipY: true,
        child: Image.asset(
          AppAssets.imagesTennisImage,
        ),
      ),
    );
  }
}
