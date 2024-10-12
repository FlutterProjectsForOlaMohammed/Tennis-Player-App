import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/register_form.dart';
import 'package:tennis_player_app/core/utils/app_styles.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: BlocProvider.of<AuthBloc>(context).absorbPointer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom == 0
                          ? 0
                          : 100,
                    ),
                    Text(
                      "REGISTER",
                      style: AppStyles.style45Bold(context),
                    ),
                    Text(
                      "CREATE AN ACCOUNT TO MAKE SDFSDF",
                      style: AppStyles.style16Light(context),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const RegisterForm(),
                    CustomTextButton(
                      textAlignmentGeometry: Alignment.center,
                      text: "HAVE AN ACCOUNT ? ",
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
