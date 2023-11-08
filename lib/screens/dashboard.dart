// // ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:mobdev_midterm/screens/settings_screen.dart';
import 'package:http/http.dart' as http;

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
        child: Column(children: [
          Text("Let's Play Trivia!",
              style: GoogleFonts.exo2(
                  textStyle: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold)))
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
              label: "Dasboard",
              backgroundColor: Color.fromARGB(255, 255, 255, 255)),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Profile",
              backgroundColor: Color.fromARGB(255, 255, 255, 255))
        ],
      ),
    );
  }

  callApi() async {
    Response response =
        await http.get(Uri.parse("https://opentdb.com/api.php?amount=10"));
    print(response.body);
  }

  void settings() {
    Navigator.pushNamed(
        context, Settings.routeName); // change to pushReplacementNamed
  }
}
