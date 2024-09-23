import 'package:flutter/material.dart';

class DialogHeader extends StatelessWidget {
  const DialogHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: 45,
        backgroundColor: Color(0xff014BB4),
        child: Icon(
          Icons.check_box,
          size: 30,
        ),
      ),
    );
  }
}
