import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/Functions/reponsive_font_size.dart';

class AnotherDateContainer extends StatelessWidget {
  const AnotherDateContainer({
    super.key,
    required this.day,
    required this.date,
  });
  final String day, date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: responsiveFontSize(context, baseFontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
