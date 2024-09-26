import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/addtional_info_for_create_user_form.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/base_info_for_create_user_form.dart';

class RegisteredDataPageView extends StatelessWidget {
  const RegisteredDataPageView(
      {super.key, required this.pageController, required this.formKey});
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      onPageChanged: (value) {
        formKey.currentState!.save();
      },
      children: const [
        BaseInfoForCreateUserForm(),
        AdditionalInfoForCreateUserForm()
      ],
    );
  }
}
