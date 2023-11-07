import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobdev_midterm/widgets/buttons/primary_button.dart';
import 'package:mobdev_midterm/widgets/buttons/secondary_button.dart';
import 'package:mobdev_midterm/widgets/formFields/custom_text_field.dart';
import 'package:mobdev_midterm/widgets/formFields/password_field.dart';
import 'package:mobdev_midterm/screens/dashboard.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 245, 234, 193),
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 70.0,
                ),
                Image.asset(
                  'lib/assets/images/logo.png',
                  height: 200,
                ),
                Text(
                  "TriviaIO",
                  style: GoogleFonts.dancingScript(
                      textStyle: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const CustomTextFormField(
                    labelText: "Email Address",
                    hintText: "Enter a valid email",
                    icon: Icons.email,
                    inputType: TextInputType.emailAddress),
                const SizedBox(height: 20.0),
                PasswordField(
                    labelText: "Password",
                    hintText: "Enter you password",
                    obscureText: obscureText,
                    onTap: setPasswordVisibility),
                const SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(
                    text: "Login", icon: Icons.login, onPressed: login),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont have an account? "),
                    SecondaryButton(text: "Register", onPressed: () {}),
                  ],
                ),
                SecondaryButton(text: "Forgot Password?", onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    Navigator.pushNamed(
        context, Dashboard.routeName); // change to pushReplacementNamed
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
