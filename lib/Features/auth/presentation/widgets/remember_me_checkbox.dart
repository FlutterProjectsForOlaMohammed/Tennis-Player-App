import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:tennis_player_app/core/utils/app_colors.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({
    super.key,
  });

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool isClicked = false;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          email = state.email;
          password = state.password;
          final prefs = await SharedPreferences.getInstance();
          await prefs.setStringList('LoginData', <String>[email, password]);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: CheckboxListTile(
          checkColor: AppColors.kPrimaryColor,
          activeColor: Colors.white.withOpacity(0.8),
          value: isClicked,
          onChanged: (value) {
            setState(() {
              isClicked = value!;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          title: const Text(
            "Remember Me",
            style: TextStyle(
                color: Colors.white, fontFamily: "Dubai", fontSize: 14),
          ),
        ),
      ),
    );
  }
}
