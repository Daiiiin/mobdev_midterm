import 'package:flutter/material.dart';
import 'package:mobdev_midterm/constants.dart';
import 'package:mobdev_midterm/screens/login_screen.dart';
import 'package:mobdev_midterm/widgets/formFields/custom_text_field.dart';
import 'package:mobdev_midterm/widgets/formFields/password_field.dart';

class SignUp extends StatefulWidget {
  static const String routeName = "signup";
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        appBar: AppBar(
          backgroundColor: primary,
          // title: const Text("SignUp"),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create an account, it's free",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const CustomTextFormField(
                        labelText: "Username",
                        hintText: "What should we call you?",
                        icon: Icons.account_circle_outlined,
                        inputType: TextInputType.name),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const CustomTextFormField(
                        labelText: "Email",
                        hintText: "Enter a valid email",
                        icon: Icons.email,
                        inputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                        labelText: "Password",
                        hintText: "Enter you password",
                        obscureText: obscureText,
                        onTap: setPasswordVisibility),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                        labelText: "Confirm Password",
                        hintText: "Confirm your password",
                        obscureText: obscureText,
                        onTap: setPasswordVisibility),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: secondary,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 17.0),
                            )
                          ],
                        ))
                  ],
                ),
                // Column(
                //   children: <Widget>[
                //     const CustomTextFormField(
                //         labelText: "Username",
                //         hintText: "What should we call you?",
                //         icon: Icons.account_circle_outlined,
                //         inputType: TextInputType.name),
                //     const SizedBox(
                //       height: 20.0,
                //     ),
                //     const CustomTextFormField(
                //         labelText: "Email",
                //         hintText: "Enter a valid email",
                //         icon: Icons.email,
                //         inputType: TextInputType.emailAddress),
                //     const SizedBox(
                //       height: 20.0,
                //     ),
                //     PasswordField(
                //         labelText: "Password",
                //         hintText: "Enter you password",
                //         obscureText: obscureText,
                //         onTap: setPasswordVisibility),
                //     const SizedBox(
                //       height: 20.0,
                //     ),
                //     PasswordField(
                //         labelText: "Confirm Password",
                //         hintText: "Confirm your password",
                //         obscureText: obscureText,
                //         onTap: setPasswordVisibility),
                //     const SizedBox(
                //       height: 20.0,
                //     ),
                //     ElevatedButton(
                //         onPressed: login,
                //         style: ElevatedButton.styleFrom(
                //             backgroundColor: secondary,
                //             padding: const EdgeInsets.symmetric(
                //                 horizontal: 40.0, vertical: 20.0),
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(30.0))),
                //         child: const Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               "Sign Up",
                //               style: TextStyle(fontSize: 17.0),
                //             )
                //           ],
                //         ))
                //   ],
                // )
              ],
            ),
          ),
        ));
  }

  void login() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
