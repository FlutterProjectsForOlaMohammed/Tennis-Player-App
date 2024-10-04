import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.icon,
    required this.hint,
    required this.onSaved,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
    this.initialValue,
    this.suffixWidget,
  });
  final IconData icon;
  final String hint;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? initialValue;
  final Widget? suffixWidget;
  final String? Function(String?)? validator;
  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        onSaved: onSaved,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          suffix: suffixWidget,
          hintText: hint,
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 28,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
          border: buildBorder(),
        ),
      ),
    );
  }

  UnderlineInputBorder buildBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(189, 189, 189, 1),
      ),
    );
  }
}
