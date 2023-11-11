// import 'package:http/http.dart' as http;
// import 'dart:convert';

class TriviaQuestion {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<String> inCorrectAnswers;
  List<String> options;

  TriviaQuestion({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.inCorrectAnswers,
    required this.options,
  });

  factory TriviaQuestion.fromJson(Map<String, dynamic> json) {
    List<String> newOptions = List<String>.from(json['incorrect_answers']);
    newOptions.add(json['correct_answer']);
    newOptions.shuffle();
    return TriviaQuestion(
      category: json['category'],
      type: json['type'],
      difficulty: json['difficulty'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      inCorrectAnswers: List<String>.from(json['incorrect_answers']),
      options: newOptions,
    );
  }
}
