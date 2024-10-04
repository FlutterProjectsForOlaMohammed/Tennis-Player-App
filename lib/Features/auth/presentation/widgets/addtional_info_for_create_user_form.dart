import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:tennis_player_app/core/Functions/empty_value_validation.dart';
import 'package:tennis_player_app/core/Functions/phone_number_validation.dart';

class AdditionalInfoForCreateUserForm extends StatefulWidget {
  const AdditionalInfoForCreateUserForm({
    super.key,
  });

  @override
  State<AdditionalInfoForCreateUserForm> createState() =>
      _AdditionalInfoForCreateUserFormState();
}

class _AdditionalInfoForCreateUserFormState
    extends State<AdditionalInfoForCreateUserForm> {
  String? country, city, phoneNumber;
  @override
  Widget build(BuildContext context) {
    final blocData = BlocProvider.of<AuthBloc>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextFormField(
          initialValue: blocData.country,
          validator: (value) {
            return emptyValueValidation(value);
          },
          icon: Icons.location_city,
          hint: "Country",
          onSaved: (value) {
            blocData.country = value;
          },
        ),
        const SizedBox(
          height: 25,
        ),
        CustomTextFormField(
          initialValue: blocData.city,
          validator: (value) {
            return emptyValueValidation(value);
          },
          icon: Icons.location_city,
          hint: "City",
          onSaved: (value) {
            blocData.city = value;
          },
        ),
        const SizedBox(
          height: 25,
        ),
        CustomTextFormField(
          initialValue: blocData.phoneNumber,
          validator: (value) {
            return phoneNumberValidation(value);
          },
          icon: Icons.phone,
          keyboardType: TextInputType.number,
          hint: "Phone Number",
          onSaved: (value) {
            blocData.phoneNumber = value;
          },
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
