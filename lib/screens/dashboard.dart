// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static const String routeName = "dashboard";
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: const Center(
        child: Text("This is the home page."),
      ),
    );
  }
}
