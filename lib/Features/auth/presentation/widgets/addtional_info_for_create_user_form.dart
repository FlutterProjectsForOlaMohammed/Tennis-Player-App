import 'package:flutter/material.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:tennis_player_app/core/Functions/email_validation.dart';
import 'package:tennis_player_app/core/Functions/password_validation.dart';

class AdditionalInfoForCreateUserForm extends StatelessWidget {
  const AdditionalInfoForCreateUserForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextFormField(
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Required Field ";
            }
            return null;
          },
          icon: Icons.location_city,
          hint: "Country",
          onSaved: (value) {},
        ),
        const SizedBox(
          height: 25,
        ),
        CustomTextFormField(
          validator: (value) {
            return emailValidation(value);
          },
          icon: Icons.location_city,
          hint: "City",
          onSaved: (value) {},
        ),
        const SizedBox(
          height: 25,
        ),
        CustomTextFormField(
          validator: (value) {
            return passwordValidation(value);
          },
          obscureText: true,
          icon: Icons.phone,
          keyboardType: TextInputType.number,
          hint: "Phone Number",
          onSaved: (value) {},
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
