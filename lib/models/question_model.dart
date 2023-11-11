// import 'package:http/http.dart' as http;
// import 'dart:convert';

class TriviaQuestion {
  String category;
  String type;
  String difficulty;
  String question;
  String correctAnswer;
  List<String> incorrectAnswers;
  // List<String> options;

  TriviaQuestion({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
    // required this.options,
  });

  factory TriviaQuestion.fromJson(Map<String, dynamic> json) {
    return TriviaQuestion(
      category: json['category'],
      type: json['type'],
      difficulty: json['difficulty'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswers: List<String>.from(json['incorrect_answers']),
    );
  }

  // Future<List<TriviaQuestion>> fetchTriviaQuestions() async {
  //   final response =
  //       await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = json.decode(response.body);
  //     final List<Map<String, dynamic>> results = List.from(data['results']);
  //     return results.map((json) => TriviaQuestion.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load trivia questions');
  //   }
  // }
}
