import 'package:flutter/material.dart';
import 'package:mobdev_midterm/constants.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'lib/assets/images/profile_pic.jpg',
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Matthew",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "matthew@gmail.com",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondary,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    "Edit Profile",
                    // style: TextStyle(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: secondary,
                  ),
                  child: const Icon(
                    Icons.score_outlined,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Total Score: 120",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: secondary,
                  ),
                  child: const Icon(
                    Icons.leaderboard_outlined,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Leaderboard Rank: 10",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
