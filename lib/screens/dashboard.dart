import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobdev_midterm/constants.dart';
import 'package:mobdev_midterm/screens/settings_screen.dart';
import 'package:mobdev_midterm/screens/trivia_screen.dart';

class Dashboard extends StatefulWidget {
  // static const String routeName = "dashboard";
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary,
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Spacer(),
        Text("Let's Play Trivia!",
            style: GoogleFonts.exo2(
                textStyle: const TextStyle(
                    fontSize: 50, fontWeight: FontWeight.bold))),
        const Text(
            "Challenge your brain with the most random trivia questions."),
        const SizedBox(
          height: 100.0,
        ),
        ElevatedButton(
          onPressed: trivia,
          style: ElevatedButton.styleFrom(
              backgroundColor: secondary,
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Start Trivia",
                style: TextStyle(fontSize: 17.0),
              )
            ],
          ),
        ),
        const Spacer(),
      ]),
    );
  }

  void settings() {
    Navigator.pushNamed(context, Settings.routeName);
  }

  void trivia() {
    Navigator.pushReplacementNamed(context, TriviaScreen.routeName);
  }
}
