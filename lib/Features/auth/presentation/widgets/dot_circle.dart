import 'package:flutter/material.dart';

class DotCircle extends StatelessWidget {
  const DotCircle({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      duration: const Duration(milliseconds: 300),
      width: isActive ? 12 : 9,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : const Color(0xff4C5469),
      ),
      height: isActive ? 12 : 9,
    );
  }
}
