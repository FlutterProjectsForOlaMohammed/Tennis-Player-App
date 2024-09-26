import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/bloc/auth_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_button.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/dot_circle_raw.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/registered_data_page_view.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  void initState() {
    listenToPagesIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RegisteredDataPageView(
            formKey: formKey,
            pageController: pageController,
          ),
          const SizedBox(
            height: 25,
          ),
          DotCircleRow(currentPage: currentPage),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            text: currentPage != 1 ? "NEXT" : "REGISTER",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var blocData = BlocProvider.of<AuthBloc>(context);
                currentPage == 0
                    ? pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear,
                      )
                    : BlocProvider.of<AuthBloc>(context).add(
                        RegisterEvent(
                            email: blocData.email!,
                            password: blocData.password!,
                            country: blocData.country!,
                            city: blocData.city!,
                            phoneNumber: blocData.phoneNumber!,
                            fullName: blocData.fullName!),
                      );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void listenToPagesIndex() {
    return pageController.addListener(
      () {
        setState(() {
          if (currentPage != pageController.page) {
            currentPage = pageController.page!.round();
          }
        });
      },
    );
  }
}
