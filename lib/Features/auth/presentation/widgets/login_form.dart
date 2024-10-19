import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_button.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/remember_me_checkbox.dart';
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
  bool visible = true;
  late TextEditingController emailController, passwordController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loadAuthenticationData();
  }

  List<String>? authData;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              CustomTextFormField(
                validator: (value) {
                  return emailValidation(value);
                },
                icon: Icons.email,
                controller: emailController,
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
                obscureText: visible,
                icon: Icons.password,
                hint: "Password",
                controller: passwordController,
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
                  password = value!;
                },
              )
            ],
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
          const RememberMeCheckBox(),
          CustomButton(
            text: "LOGIN",
            onPressed: () async {
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

  Future<void> loadAuthenticationData() async {
    authData = await sharedPreferenceAuthentication();
    if (authData != null) {
      emailController.text = authData!.first;
      passwordController.text = authData!.last;
    }
  }

  Future<List<String>?> sharedPreferenceAuthentication() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? loginData = prefs.getStringList("LoginData");

    return loginData;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
