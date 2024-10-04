import 'package:flutter/material.dart';

responsiveFontSize(BuildContext context, {required double baseFontSize}) {
  double scaleFactor = MediaQuery.sizeOf(context).width / 480;
  double reponsiveFont = baseFontSize * scaleFactor;
  return reponsiveFont.clamp(baseFontSize * 0.7, baseFontSize * 1.2);
}
