import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/bloc/auth_bloc.dart';
import 'package:tennis_player_app/core/widgets/show_dialog.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        checkFailureAuthState(state, context);
        if (state is LoginSuccessState || state is RegisterSuccessState) {
          showingDialog(
            context,
            title: "Sucessfully",
            headerIcon: Icons.check,
          );
        }
        if (state is ResetPasswordSuccessState) {
          showingDialog(context,
              title: "Check Your Email and Reset Your Password",
              headerIcon: Icons.check_circle_outline_rounded);
        }
      },
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.sizeOf(context).width - 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(1, 75, 180, 1),
            ),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: state is LoginLoadingState ||
                      state is RegisterLoadingState ||
                      state is ResetPasswordLoadingState
                  ? const CupertinoActivityIndicator(
                      color: Color(0xffFDF5FE),
                    )
                  : Text(
                      text,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFDF5FE),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  void checkFailureAuthState(AuthState state, BuildContext context) {
    if (state is RegisterFailureState) {
      showingDialog(
        context,
        title: state.message,
        headerIcon: Icons.error_outline_rounded,
      );
    } else if (state is LoginFailureState) {
      showingDialog(
        context,
        title: state.message,
        headerIcon: Icons.error_outline_rounded,
      );
    } else if (state is ResetPasswordFailureState) {
      showingDialog(
        context,
        title: state.message,
        headerIcon: Icons.error_outline_rounded,
      );
    }
  }
}
