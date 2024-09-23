import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/cutsom_button.dart';
import 'package:tennis_player_app/core/Functions/email_validation.dart';
import 'package:tennis_player_app/core/Functions/password_validation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            validator: (value) {
              return emailValidation(value);
            },
            icon: Icons.email,
            hint: "Email",
            onSaved: (value) {},
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextFormField(
            validator: (value) {
              return passwordValidation(value);
            },
            obscureText: true,
            icon: Icons.password,
            hint: "Password",
            onSaved: (value) {},
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextButton(
            textAlignmentGeometry: Alignment.centerRight,
            text: "Forget Your Password ? ",
            onPressed: () {},
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            text: "LOGIN",
            onPressed: () {
              if (formKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
