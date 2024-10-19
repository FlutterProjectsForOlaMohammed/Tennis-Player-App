import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/Profile/Presentation/view%20model/Update%20User%20Info%20Bloc/update_user_info_bloc.dart';
import 'package:tennis_player_app/Features/auth/domain/Entities/user_entity.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:tennis_player_app/core/Functions/empty_value_validation.dart';
import 'package:tennis_player_app/core/Functions/phone_number_validation.dart';

class ProfileInformation extends StatefulWidget {
  const ProfileInformation({
    super.key,
    required this.user,
  });
  final UserEntity user;
  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UpdateUserInfoBloc>(context);
    return BlocBuilder<UpdateUserInfoBloc, UpdateUserInfoState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomTextFormField(
                initialValue: widget.user.fullName,
                validator: (value) {
                  return emptyValueValidation(value);
                },
                icon: Icons.person_2,
                hint: "Full Name",
                onSaved: (value) {
                  if (userBloc.fullName != value) {
                    userBloc.fullName = value!;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomTextFormField(
                initialValue: widget.user.email,
                validator: null,
                icon: Icons.email,
                hint: "Email",
                onSaved: (value) {},
                enable: false,
                readOnly: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomTextFormField(
                initialValue: widget.user.password,
                validator: null,
                icon: Icons.password,
                hint: "Password",
                enable: false,
                onSaved: (value) {},
                readOnly: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomTextFormField(
                initialValue: widget.user.country,
                validator: (value) {
                  return emptyValueValidation(value);
                },
                icon: Icons.location_city,
                hint: "Country",
                onSaved: (value) {
                  if (userBloc.country != value) {
                    userBloc.country = value!;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomTextFormField(
                initialValue: widget.user.city,
                validator: (value) {
                  return emptyValueValidation(value);
                },
                icon: Icons.location_city,
                hint: "City",
                onSaved: (value) {
                  if (userBloc.city != value) {
                    userBloc.city = value!;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomTextFormField(
                initialValue: widget.user.phoneNumber,
                validator: (value) {
                  return phoneNumberValidation(value);
                },
                icon: Icons.phone,
                hint: "Phone Number",
                onSaved: (value) {
                  if (userBloc.phoneNumber != value) {
                    userBloc.phoneNumber = value!;
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
