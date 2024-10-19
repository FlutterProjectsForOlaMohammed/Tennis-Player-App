import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/core/common/blocs/BottomNavigationBarBloc/bottom_navigation_bar_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/GetUserLocationBloc/get_user_location_bloc.dart';
import 'package:tennis_player_app/core/common/blocs/GetWeatherBloc/get_weather_bloc.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';
import 'package:tennis_player_app/core/Functions/show_message.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserLocationBloc, GetUserLocationState>(
      listener: (context, state) {
        if (state is GetUserLocationFailure) {
          showMessage(message: state.message);
        } else if (state is GetUserLocationSuccess) {
          BlocProvider.of<BottomNavigationBarBloc>(context).add(
            NavigateToWatherBodyEvent(),
          );
          BlocProvider.of<GetWeatherBloc>(context).add(
            GetForcastWeatherEvent(
                location: "${state.position[0]},${state.position[1]}"),
          );
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.sizeOf(context).width - 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(1, 75, 180, 1),
            ),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: state is GetUserLocationLoading
                  ? const CupertinoActivityIndicator(
                      color: Color(0xffFDF5FE),
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        fontSize: responsiveFontSize(context, baseFontSize: 26),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffFDF5FE),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
