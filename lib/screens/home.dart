import 'package:flutter/material.dart';
import 'package:mobdev_midterm/constants.dart';
import 'package:mobdev_midterm/screens/dashboard.dart';
import 'package:mobdev_midterm/screens/profile_screen.dart';
import 'package:mobdev_midterm/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int pageIndex = 0;
  final List<Widget> _pages = [
    const Dashboard(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(onPressed: settings, icon: const Icon(Icons.settings))
        ],
        backgroundColor: secondary,
      ),
      body: _pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        backgroundColor: secondary,
        type: BottomNavigationBarType.fixed,
        // selected
        selectedIconTheme: const IconThemeData(size: 26),
        selectedFontSize: 15,
        selectedItemColor: Colors.white,
        // unselected
        showUnselectedLabels: false,
        unselectedItemColor: primary,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
          )
        ],
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }

  void settings() {
    Navigator.pushNamed(context, Settings.routeName);
  }
}
