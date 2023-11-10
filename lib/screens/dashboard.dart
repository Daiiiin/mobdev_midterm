// // ignore_for_file: file_names
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:mobdev_midterm/models/question_model.dart';
import 'package:mobdev_midterm/screens/settings_screen.dart';
import 'package:mobdev_midterm/screens/trivia_screen.dart';
import 'package:mobdev_midterm/widgets/buttons/primary_button.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "dashboard";
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HOME",
        ),
        actions: [
          IconButton(onPressed: settings, icon: const Icon(Icons.settings))
        ],
        backgroundColor: const Color.fromARGB(255, 24, 46, 94),
      ),
      body: Container(
        color: const Color.fromARGB(255, 148, 191, 255),
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
          PrimaryButton(
              text: "Start Trivia",
              icon: Icons.play_arrow,
              onPressed: trivia,
              color: const Color.fromARGB(255, 24, 46, 94)),
          const Spacer(),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 24, 46, 94),
        unselectedLabelStyle:
            const TextStyle(color: Colors.white, fontSize: 14),
        unselectedItemColor: const Color.fromARGB(255, 148, 191, 255),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Home",
              backgroundColor: Color.fromARGB(255, 255, 255, 255)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Profile",
              backgroundColor: Color.fromARGB(255, 255, 255, 255))
        ],
      ),
    );
  }

  // void main() async {
  //   try {
  //     List<TriviaQuestion> questions = await callApi();
  //     for (var question in questions) {
  //       print('Category: ${question.category}');
  //       print('Question: ${question.question}');
  //       print('Correct Answer: ${question.correctAnswer}');
  //       print('Incorrect Answers: ${question.incorrectAnswers}');
  //       print('---');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  void settings() {
    Navigator.pushNamed(
        context, Settings.routeName); // change to pushReplacementNamed
  }

  void trivia() {
    Navigator.pushNamed(
        context, TriviaScreen.routeName); // change to pushReplacementNamed
  }
}
