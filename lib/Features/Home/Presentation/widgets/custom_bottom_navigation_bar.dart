import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/core/common/blocs/BottomNavigationBarBloc/bottom_navigation_bar_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/custom_bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int isSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: BlocConsumer<BottomNavigationBarBloc, BottomNavigationBarState>(
        listener: (context, state) {
          automaticNavigation(state);
        },
        builder: (context, state) {
          return NavigationBar(
            animationDuration: const Duration(seconds: 1),
            backgroundColor: Colors.white.withOpacity(0.15),
            destinations: [
              CustomBottomNavigationBarItem(
                icon: Icons.person_2_rounded,
                onTap: () {
                  if (isSelected != 0) {
                    setState(() {
                      isSelected = 0;
                    });
                    BlocProvider.of<BottomNavigationBarBloc>(context).add(
                      NavigateToProfileEvent(),
                    );
                  }
                },
                text: "Profile",
                isActive: isSelected == 0,
              ),
              CustomBottomNavigationBarItem(
                onTap: () {
                  if (isSelected != 1) {
                    setState(() {
                      isSelected = 1;
                    });
                    BlocProvider.of<BottomNavigationBarBloc>(context).add(
                      NavigateToWeatherDeterminationEvent(),
                    );
                  }
                },
                icon: Icons.home,
                text: "Home",
                isActive: isSelected == 1,
              ),
              CustomBottomNavigationBarItem(
                onTap: () {
                  if (isSelected != 2) {
                    setState(() {
                      isSelected = 2;
                    });
                    BlocProvider.of<BottomNavigationBarBloc>(context).add(
                      NavigateToFavoriteEvent(),
                    );
                  }
                },
                icon: Icons.star,
                text: "Fav",
                isActive: isSelected == 2,
              )
            ],
          );
        },
      ),
    );
  }

  int automaticNavigation(BottomNavigationBarState state) {
    return isSelected = (state is NavigateToWeatherBodyState ||
            state is NavigateToWeatherDeteminationState)
        ? 1
        : (state is NavigateToFavoriteState)
            ? 2
            : 0;
  }
}
