import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/back_button.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_button.dart';
import 'package:tennis_player_app/core/Functions/email_validation.dart';
import 'package:tennis_player_app/core/utils/app_styles.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  GlobalKey<FormState> formKey = GlobalKey();
  late String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: BlocProvider.of<AuthBloc>(context).absorbPointer,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    BackingButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text(
                                    "Reset Your Password",
                                    style: AppStyles.style45Bold(context),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CustomTextFormField(
                                icon: Icons.email,
                                hint: "Enter Your Email",
                                onSaved: (value) {
                                  email = value!;
                                },
                                validator: (value) {
                                  return emailValidation(value);
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CustomButton(
                                text: "Reset",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    BlocProvider.of<AuthBloc>(context).add(
                                      ResetPasswordEvent(email: email),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
