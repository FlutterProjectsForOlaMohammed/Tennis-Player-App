import 'package:flutter/material.dart';

class DestinationTextFormField extends StatelessWidget {
  const DestinationTextFormField({
    super.key,
    required this.hint,
    required this.onSaved,
    required this.validator,
    required this.onTap,
  });

  final String hint;

  final String? Function(String?)? validator;
  final void Function(String?) onSaved;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLines: 3,
      validator: validator,
      onSaved: onSaved,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color.fromRGBO(123, 123, 123, 1),
      ),
    );
  }
}
