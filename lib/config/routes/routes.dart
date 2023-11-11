import 'package:flutter/material.dart';
// import 'package:mobdev_midterm/screens/Dashboard.dart';
import 'package:mobdev_midterm/screens/home.dart';
import 'package:mobdev_midterm/screens/login_screen.dart';
import 'package:mobdev_midterm/screens/profile_screen.dart';
import 'package:mobdev_midterm/screens/settings_screen.dart';
import 'package:mobdev_midterm/screens/signup_screen.dart';
import 'package:mobdev_midterm/screens/trivia_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
  // Dashboard.routeName: (BuildContext context) => const Dashboard(),
  Settings.routeName: (BuildContext context) => const Settings(),
  TriviaScreen.routeName: (BuildContext context) => const TriviaScreen(),
  SignUp.routeName: (BuildContext context) => const SignUp(),
  ProfileScreen.routeName: (BuildContext context) => const ProfileScreen(),
  HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
};
