import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';

class CustomTextContainer extends StatelessWidget {
  const CustomTextContainer({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
          ),
          color: Colors.white.withOpacity(0.15),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: responsiveFontSize(context, baseFontSize: 20),
            color: Colors.grey[200],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
