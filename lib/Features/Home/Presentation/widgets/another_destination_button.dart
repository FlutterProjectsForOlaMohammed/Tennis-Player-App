import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';

import '../../../../core/common/blocs/BottomNavigationBarBloc/bottom_navigation_bar_bloc.dart';

class AnotherDestinationButton extends StatelessWidget {
  const AnotherDestinationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: () {
          BlocProvider.of<BottomNavigationBarBloc>(context)
              .add(NavigateToWeatherDeterminationEvent());
        },
        child: Text(
          "Another Destination",
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: responsiveFontSize(context, baseFontSize: 18)),
        ),
      ),
    );
  }
}
