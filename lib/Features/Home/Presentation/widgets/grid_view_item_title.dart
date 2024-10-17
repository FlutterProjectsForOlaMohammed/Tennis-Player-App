import 'package:flutter/material.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';

class GridViewItemTitle extends StatelessWidget {
  const GridViewItemTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: LayoutBuilder(builder: (context, constrains) {
        final text = TextSpan(
          text: title,
          style: TextStyle(
            fontSize: responsiveFontSize(context, baseFontSize: 20),
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
          ),
        );

        final textPainter = TextPainter(
          text: text,
          maxLines: 2,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constrains.maxWidth);
        if (textPainter.didExceedMaxLines) {
          return FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                fontSize: responsiveFontSize(context, baseFontSize: 20),
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        } else {
          return Text(
            title,
            style: TextStyle(
              fontSize: responsiveFontSize(context, baseFontSize: 20),
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w700,
            ),
          );
        }
      }),
    );
  }
}
