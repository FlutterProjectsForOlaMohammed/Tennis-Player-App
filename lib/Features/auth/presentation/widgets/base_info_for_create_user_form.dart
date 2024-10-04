import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:tennis_player_app/core/Functions/email_validation.dart';
import 'package:tennis_player_app/core/Functions/empty_value_validation.dart';
import 'package:tennis_player_app/core/Functions/password_validation.dart';

class BaseInfoForCreateUserForm extends StatefulWidget {
  const BaseInfoForCreateUserForm({
    super.key,
  });

  @override
  State<BaseInfoForCreateUserForm> createState() =>
      _BaseInfoForCreateUserFormState();
}

class _BaseInfoForCreateUserFormState extends State<BaseInfoForCreateUserForm> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    final blocData = BlocProvider.of<AuthBloc>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextFormField(
          initialValue: blocData.fullName,
          validator: (value) {
            return emptyValueValidation(value);
          },
          icon: Icons.person_2,
          hint: "Full Name",
          onSaved: (value) {
            blocData.fullName = value;
          },
        ),
        const SizedBox(
          height: 25,
        ),
        CustomTextFormField(
          initialValue: blocData.email,
          validator: (value) {
            return emailValidation(value);
          },
          icon: Icons.email,
          hint: "Email",
          onSaved: (value) {
            blocData.email = value;
          },
        ),
        const SizedBox(
          height: 25,
        ),
        CustomTextFormField(
          initialValue: blocData.password,
          validator: (value) {
            return passwordValidation(value);
          },
          obscureText: visible,
          icon: Icons.password,
          hint: "Password",
          suffixWidget: InkWell(
            onTap: () {
              setState(() {
                visible = !visible;
              });
            },
            child: visible
                ? const Icon(
                    Icons.visibility,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.white,
                  ),
          ),
          onSaved: (value) {
            blocData.password = value;
          },
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
