import 'package:flutter/material.dart';
import 'package:mobdev_midterm/screens/login_screen.dart';
import 'package:mobdev_midterm/widgets/buttons/primary_button.dart';

class Settings extends StatefulWidget {
  static const String routeName = "settings";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrimaryButton(
                  text: "Logout",
                  icon: Icons.logout,
                  onPressed: logout,
                  color: const Color.fromARGB(255, 24, 46, 94),
                )
              ],
            ),
          )),
    );
  }

  void logout() {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
}
