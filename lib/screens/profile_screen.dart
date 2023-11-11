import 'package:flutter/material.dart';
import 'package:mobdev_midterm/constants.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primary,
      body: Center(child: Text("This is the profile page")),
    );
  }
}
