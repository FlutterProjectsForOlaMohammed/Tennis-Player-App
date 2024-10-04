import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/Functions/reponsive_font_size.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textAlignmentGeometry,
  });
  final String text;
  final AlignmentGeometry textAlignmentGeometry;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: textAlignmentGeometry,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: const Color.fromARGB(255, 49, 76, 143),
            fontSize: responsiveFontSize(context, baseFontSize: 17),
          ),
        ),
      ),
    );
  }
}
