import 'package:flutter/material.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.white.withOpacity(0.2),
        ),
        onPressed: onPressed,
        child: Text(
          "Get Your Location",
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
