import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:tennis_player_app/core/Functions/responsive_font_size.dart';
import 'package:tennis_player_app/core/utils/app_routes.dart';
import 'package:tennis_player_app/core/widgets/show_dialog.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        checkFailureAuthState(state, context);
        checkSuccessAuthState(state, context);
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
                      style: TextStyle(
                        fontSize: responsiveFontSize(context, baseFontSize: 26),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffFDF5FE),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  void checkSuccessAuthState(AuthState state, BuildContext context) {
    if (state is LoginSuccessState) {
      GoRouter.of(context)
          .pushReplacement(AppRoutes.homeView, extra: state.email);
    } else if (state is RegisterSuccessState) {
      GoRouter.of(context)
          .pushReplacement(AppRoutes.homeView, extra: state.email);
    }
    if (state is ResetPasswordSuccessState) {
      showingDialog(context,
          title: "Check Your Email and Reset Your Password",
          headerIcon: Icons.check_circle_outline_rounded);
    }
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
