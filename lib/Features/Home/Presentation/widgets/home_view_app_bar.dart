import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/UserInfoBloc/get_user_info_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/widgets/another_destination_button.dart';
import 'package:tennis_player_app/core/Functions/reponsive_font_size.dart';
import 'package:tennis_player_app/core/utils/app_colors.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserInfoBloc, GetUserInfoState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Hello",
            style: TextStyle(
              fontSize: responsiveFontSize(context, baseFontSize: 32),
              fontFamily: "Pacifico",
              color: AppColors.lightBlue,
              fontWeight: FontWeight.w900,
            ),
          ),
          subtitle: (state is GetUserInfoLoading)
              ? const CupertinoActivityIndicator()
              : (state is GetUserInfoSuccess)
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state.userEntity.fullName,
                        style: TextStyle(
                            fontSize:
                                responsiveFontSize(context, baseFontSize: 22)),
                      ),
                    )
                  : null,
          trailing: const AnotherDestinationButton(),
        );
      },
    );
  }
}
