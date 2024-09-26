import 'package:flutter/material.dart';

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
          style: const TextStyle(
            color: Color.fromARGB(255, 49, 76, 143),
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
