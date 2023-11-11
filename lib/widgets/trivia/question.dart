import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  final int indexAction;
  final int totalQuestion;

  const Question(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text('Question ${indexAction + 1}/ $totalQuestion: $question'),
    );
  }
}
