import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:mobdev_midterm/screens/login_screen.dart';
import 'package:mobdev_midterm/config/routes/routes.dart';

void main() {
  runApp(MaterialApp(
    home: const LoginScreen(),
    routes: routes,
  ));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
