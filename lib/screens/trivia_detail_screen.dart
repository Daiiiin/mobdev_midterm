import 'package:flutter/material.dart';
import 'package:mobdev_midterm/models/question_model.dart';

class TriviaDetailScreen extends StatelessWidget {
  final TriviaQuestion question;

  TriviaDetailScreen({required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trivia Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category: ${question.category}'),
            Text('Type: ${question.type}'),
            Text('Difficulty: ${question.difficulty}'),
            Text('Question: ${question.question}'),
            Text('Correct Answer: ${question.correctAnswer}'),
            Text('Incorrect Answers: ${question.incorrectAnswers.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
