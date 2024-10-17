import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (MediaQuery.sizeOf(context).width * (0.5)) - 50,
      top: (MediaQuery.sizeOf(context).height * (0.15)) - 60,
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.transparent,
        child: CircleAvatar(
          radius: 58,
          backgroundColor: Colors.white.withOpacity(0.4),
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 70,
          ),
        ),
      ),
    );
  }
}
