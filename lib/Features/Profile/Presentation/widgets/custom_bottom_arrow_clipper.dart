import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CustomBottomArrowClipper extends StatelessWidget {
  const CustomBottomArrowClipper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ClipPath(
        clipper: ArrowClipper(50, 90, Edge.BOTTOM),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.2,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.amber[300],
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
}
