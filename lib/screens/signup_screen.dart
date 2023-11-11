import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static const String routeName = "signup";
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: const Center(child: Text("This is the signup page")),
    );
  }
}
