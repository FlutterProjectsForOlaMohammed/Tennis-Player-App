import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/view%20model/bloc/bloc/auth_bloc.dart';
import 'package:tennis_player_app/Features/auth/presentation/widgets/custom_text_form_field.dart';

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
            if (value?.isEmpty ?? true) {
              return "Required Field ";
            }
            return null;
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
            if (value?.isEmpty ?? true) {
              return "Required Field ";
            }
            return null;
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
            if (value?.isEmpty ?? true) {
              return "Required Field ";
            }
            if (value!.length != 11) {
              return "it must be 11 numbers";
            }
            if (value.substring(0, 3) == "010" ||
                value.substring(0, 3) == "011" ||
                value.substring(0, 3) == "012" ||
                value.substring(0, 3) == "015") {
              return null;
            } else {
              return "Your Number Must Begin With 010 / 011 / 012 / 015";
            }
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
