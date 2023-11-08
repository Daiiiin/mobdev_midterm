// // ignore_for_file: file_names

// import 'package:flutter/material.dart';

// class Dashboard extends StatelessWidget {
//   static const String routeName = "dashboard";
//   const Dashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home"),
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
//         ],
//       ),
//       body: const Center(
//         child: Text("This is the home page."),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mobdev_midterm/screens/settings_screen.dart';

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
        title: const Text("Home"),
        actions: [
          IconButton(onPressed: settings, icon: const Icon(Icons.settings))
        ],
      ),
      body: const Center(
        child: Text("This is the dashboard"),
      ),
    );
  }

  void settings() {
    Navigator.pushNamed(
        context, Settings.routeName); // change to pushReplacementNamed
  }
}
