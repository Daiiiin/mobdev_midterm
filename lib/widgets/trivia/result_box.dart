import 'package:flutter/material.dart';
import 'package:mobdev_midterm/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  }) : super(key: key);
  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primary,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 22.0),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(
              radius: 70.0,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow // when the result is half of the questions
                  : result < questionLength / 2
                      ? incorrect // when the result is less than half
                      : correct, // when the result is more than half
              child: Text(
                '$result/$questionLength',
                style: const TextStyle(fontSize: 30.0),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              result == questionLength / 2
                  ? 'Almost There' // when the result is half of the questions
                  : result < questionLength / 2
                      ? 'Nice try.' // when the result is less than half
                      : 'You did great!', // when the result is more than half
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            const SizedBox(height: 25.0),
            TextButton(
              onPressed: onPressed,
              child: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  letterSpacing: 1.0,
                ),
              ),
            )
            // GestureDetector(
            //   onTap: onPressed,
            //   child: const Text(
            //     'Home',
            //     style: TextStyle(
            //       color: Colors.blue,
            //       fontSize: 20.0,
            //       letterSpacing: 1.0,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
