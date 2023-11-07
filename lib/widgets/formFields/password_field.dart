import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final VoidCallback onTap;
  const PasswordField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.obscureText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: const Icon(Icons.lock),
          ),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          ),
          labelText: labelText,
          border: const OutlineInputBorder()),
    );
  }
}
