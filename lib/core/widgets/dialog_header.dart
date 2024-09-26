import 'package:flutter/material.dart';

class DialogHeader extends StatelessWidget {
  const DialogHeader({
    super.key,
    required this.headerIcon,
  });
  final IconData headerIcon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: 45,
        backgroundColor: const Color(0xff014BB4),
        child: Icon(
          headerIcon,
          size: 30,
        ),
      ),
    );
  }
}
