import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Text(
        "Cancel",
        style: TextStyle(
          color: Color(0xff014BB4),
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
