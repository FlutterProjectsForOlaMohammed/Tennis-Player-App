import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_button.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/login_form.dart';
import 'package:tennis_player_app/core/utils/app_routes.dart';
import 'package:tennis_player_app/core/utils/app_styles.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: SingleChildScrollView(
              child:
                  BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                return AbsorbPointer(
                  absorbing: BlocProvider.of<AuthBloc>(context).absorbPointer,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom == 0
                            ? 10
                            : 50,
                      ),
                      Text(
                        "LOGIN",
                        style: AppStyles.style45Bold(context),
                      ),
                      Text(
                        "CREATE AN ACCOUNT TO MAKE SDFSDF",
                        style: AppStyles.style16Light(context),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      const LoginForm(),
                      CustomTextButton(
                        textAlignmentGeometry: Alignment.center,
                        text: "DON'T HAVE AN ACCOUNT ? ",
                        onPressed: () {
                          GoRouter.of(context).push(AppRoutes.registerView);
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
