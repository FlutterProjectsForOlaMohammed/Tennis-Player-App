import 'package:flutter/material.dart';

class OkButton extends StatelessWidget {
  const OkButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Text(
        "Ok",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Color(0xff014BB4),
        ),
      ),
      onPressed: () {},
    );
  }
}
