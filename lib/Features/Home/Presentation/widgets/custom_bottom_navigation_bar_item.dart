import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    required this.isActive,
  });
  final void Function() onTap;
  final IconData icon;
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 10,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.yellow[100],
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: isActive ? 28 : 26,
              color: isActive ? Colors.yellowAccent : null,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              text,
              style: isActive
                  ? TextStyle(
                      fontSize: responsiveFontSize(context, baseFontSize: 17),
                      fontWeight: FontWeight.w700,
                      shadows: const [
                        Shadow(
                          blurRadius: 40,
                          offset: Offset(0, 0),
                          color: Color.fromRGBO(224, 224, 224, 1),
                        ),
                      ],
                    )
                  : TextStyle(
                      fontSize: responsiveFontSize(context, baseFontSize: 15),
                      fontWeight: FontWeight.w500,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
