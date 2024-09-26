import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/bloc/auth_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_button.dart';
import 'package:tennis_player_app/core/Functions/email_validation.dart';
import 'package:tennis_player_app/core/Functions/password_validation.dart';
import 'package:tennis_player_app/core/utils/app_routes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  late String email, password;
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
            onSaved: (value) {
              email = value!;
            },
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
            onSaved: (value) {
              password = value!;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextButton(
            textAlignmentGeometry: Alignment.centerRight,
            text: "Forget Your Password ? ",
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.resetPasswordView);
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            text: "LOGIN",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BlocProvider.of<AuthBloc>(context).add(
                  LoginEvent(email: email, password: password),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
