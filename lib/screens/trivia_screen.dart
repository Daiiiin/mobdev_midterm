import 'package:flutter/material.dart';
import 'package:mobdev_midterm/models/question_model.dart';
import 'package:mobdev_midterm/screens/trivia_detail_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TriviaScreen extends StatefulWidget {
  static const String routeName = "triviaScreen";

  const TriviaScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _TriviaScreenState createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
  late Future<List<TriviaQuestion>> futureQuestions;

  @override
  void initState() {
    super.initState();
    futureQuestions = fetchTriviaQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia App'),
      ),
      body: Center(
        child: FutureBuilder<List<TriviaQuestion>>(
          future: futureQuestions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return TriviaList(questions: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<List<TriviaQuestion>> fetchTriviaQuestions() async {
    final response =
        await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<Map<String, dynamic>> results = List.from(data['results']);
      return results.map((json) => TriviaQuestion.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load trivia questions');
    }
  }
}

class TriviaList extends StatelessWidget {
  final List<TriviaQuestion> questions;

  const TriviaList({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(questions[index].question),
          subtitle: Text('Category: ${questions[index].category}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TriviaDetailScreen(question: questions[index]),
              ),
            );
          },
        );
      },
    );
  }
}
