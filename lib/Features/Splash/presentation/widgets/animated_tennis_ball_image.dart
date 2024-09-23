import 'package:flutter/material.dart';

class AnimatedTennisBallImage extends StatefulWidget {
  const AnimatedTennisBallImage({
    super.key,
    required this.child,
    required this.isFlipped,
  });
  final Widget child;
  final bool isFlipped;
  @override
  State<AnimatedTennisBallImage> createState() =>
      _AnimatedTennisBallImageState();
}

class _AnimatedTennisBallImageState extends State<AnimatedTennisBallImage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    initSlideAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: animation,
        child: widget.child,
      ),
    );
  }

  void initSlideAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = Tween<Offset>(
            begin: Offset.zero,
            end: widget.isFlipped
                ? const Offset(-0.5, 1.3)
                : const Offset(0.5, -1.3))
        .animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
