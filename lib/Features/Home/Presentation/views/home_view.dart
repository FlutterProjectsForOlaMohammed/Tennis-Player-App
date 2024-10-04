import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/view%20models/Favorite%20Locations%20Bloc/favorite_locations_bloc.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/views/favorite_view.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/UserInfoBloc/get_user_info_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/determine_user_location_body.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/home_view_app_bar.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/user_location_body.dart';
import 'package:tennis_player_app/core/di/service_locator.dart';
import '../view model/BottomNavigationBarBloc/bottom_navigation_bar_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.email});
  final String email;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isVisiable = true;

  @override
  void initState() {
    addWeatherAndNavigationEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        email: widget.email,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              const HomeViewAppBar(),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
                builder: (context, state) {
                  if (state is NavigateToWeatherBodyState) {
                    return const UserLocationBody();
                  } else if (state is NavigateToWeatherDeteminationState) {
                    return const DetermineUserLocationBody();
                  } else {
                    return BlocProvider(
                      create: (context) =>
                          FavoriteLocationsBloc(sl(), sl(), sl()),
                      child: const FavoriteView(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void addWeatherAndNavigationEvents() {
    BlocProvider.of<GetUserInfoBloc>(context).add(
      GetUserEvent(email: widget.email),
    );
    BlocProvider.of<BottomNavigationBarBloc>(context);
  }
}
