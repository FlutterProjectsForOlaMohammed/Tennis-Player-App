import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Home/Presentation/view%20model/Get%20User%20Info/get_user_info_bloc.dart';
import 'package:tennis_player_app/Features/Profile/Presentation/view%20model/Update%20User%20Info%20Bloc/update_user_info_bloc.dart';
import 'package:tennis_player_app/Features/Profile/Presentation/widgets/custom_bottom_arrow_clipper.dart';
import 'package:tennis_player_app/Features/Profile/Presentation/widgets/profile_image.dart';
import 'package:tennis_player_app/Features/Profile/Presentation/widgets/profile_information.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.userEntity});
  final UserEntity userEntity;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UpdateUserInfoBloc>(context);

    return Form(
      key: formKey,
      child: Expanded(
        child: Column(
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBottomArrowClipper(),
                  const Spacer(),
                  BlocListener<UpdateUserInfoBloc, UpdateUserInfoState>(
                    listener: (context, state) {
                      if (state is UpdateUserInfoSuccess) {
                        BlocProvider.of<GetUserInfoBloc>(context).add(
                          GetUserEvent(email: widget.userEntity.email),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: TextButton(
                        child: Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                responsiveFontSize(context, baseFontSize: 32),
                            shadows: const [
                              Shadow(
                                blurRadius: 40,
                                offset: Offset(0, 0),
                                color: Color.fromRGBO(176, 175, 175, 1),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          updateUseData(context, userBloc);
                        },
                      ),
                    ),
                  )
                ],
              ),
              const ProfileImage()
            ]),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ProfileInformation(
                  user: widget.userEntity,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateUseData(BuildContext context, UpdateUserInfoBloc userBloc) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      BlocProvider.of<UpdateUserInfoBloc>(context).add(
        UpdateUserEvent(
          email: widget.userEntity.email,
          body: {
            'fullName': userBloc.fullName ?? widget.userEntity.fullName,
            'phoneNumber':
                userBloc.phoneNumber ?? widget.userEntity.phoneNumber,
            'city': userBloc.city ?? widget.userEntity.city,
            'country': userBloc.country ?? widget.userEntity.country,
          },
        ),
      );
    }
  }
}
