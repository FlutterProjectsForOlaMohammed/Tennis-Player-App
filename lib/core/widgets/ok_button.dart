import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';

class OkButton extends StatelessWidget {
  const OkButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Text(
        "Ok",
        style: TextStyle(
          fontSize: responsiveFontSize(context, baseFontSize: 22),
          fontWeight: FontWeight.w500,
          color: const Color(0xff014BB4),
        ),
      ),
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
