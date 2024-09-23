import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/dot_circle.dart';

class DotCircleRow extends StatefulWidget {
  const DotCircleRow({super.key, required this.currentPage});
  final int currentPage;
  @override
  State<DotCircleRow> createState() => _DotCircleRowState();
}

class _DotCircleRowState extends State<DotCircleRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) {
          return DotCircle(
            isActive: (widget.currentPage == index),
          );
        },
      ),
    );
  }
}
