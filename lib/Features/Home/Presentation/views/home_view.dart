import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/Get%20User%20Info/get_user_info_bloc.dart';
import 'package:tennis_player_app/core/common/blocs/Favorite%20Locations%20Bloc/favorite_locations_bloc.dart';
import 'package:tennis_player_app/Features/Favorite/Presentation/views/favorite_view.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/determine_user_location_body.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/home_view_app_bar.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/user_location_body.dart';
import 'package:tennis_player_app/Features/Profile/Presentation/views/profile_view.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/di/service_locator.dart';
import '../../../../core/common/blocs/BottomNavigationBarBloc/bottom_navigation_bar_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.email});
  final String email;
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isVisiable = true;
  late UserEntity user;
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
      body: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          return SafeArea(
            top: (state is NavigateToProfileState) ? false : true,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (state is NavigateToProfileState) ? 0 : 32,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  BlocBuilder<BottomNavigationBarBloc,
                      BottomNavigationBarState>(
                    builder: (context, state) {
                      if (state is NavigateToProfileState) {
                        return const SizedBox.shrink();
                      }
                      return const HomeViewAppBar();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<BottomNavigationBarBloc,
                      BottomNavigationBarState>(
                    builder: (context, state) {
                      if (state is NavigateToWeatherBodyState) {
                        return UserLocationBody(email: widget.email);
                      } else if (state is NavigateToWeatherDeteminationState) {
                        return const DetermineUserLocationBody();
                      } else if (state is NavigateToFavoriteState) {
                        return BlocProvider(
                          create: (context) =>
                              FavoriteLocationsBloc(sl(), sl(), sl()),
                          child: FavoriteView(email: widget.email),
                        );
                      } else {
                        return BlocConsumer<GetUserInfoBloc, GetUserInfoState>(
                          listener: (context, userState) {
                            if (userState is GetUserInfoSuccess) {
                              user = userState.userEntity;
                            }
                          },
                          builder: (context, userState) {
                            if (userState is GetUserInfoSuccess) {
                              return ProfileView(
                                userEntity: userState.userEntity,
                              );
                            }
                            return const Expanded(
                              child: Center(
                                child: CupertinoActivityIndicator(),
                              ),
                            );
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
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
