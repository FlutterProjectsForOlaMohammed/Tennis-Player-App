import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';

class AppStyles {
  static TextStyle style32Regular(BuildContext context) {
    return TextStyle(
      fontFamily: "Agbalumo",
      color: (Colors.white),
      fontSize: responsiveFontSize(context, baseFontSize: 32),
    );
  }

  static TextStyle style16Light(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(context, baseFontSize: 16),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle style45Bold(BuildContext context) {
    return TextStyle(
      fontSize: responsiveFontSize(context, baseFontSize: 45),
      fontWeight: FontWeight.w700,
    );
  }
}
