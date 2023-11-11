import 'package:flutter/material.dart';
import 'package:mobdev_midterm/constants.dart';

class SignUp extends StatelessWidget {
  static const String routeName = "signup";
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: secondary,
        title: const Text("SignUp"),
      ),
      body: const Center(child: Text("This is the signup page")),
    );
  }
}
