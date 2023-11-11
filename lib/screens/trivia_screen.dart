import 'package:flutter/material.dart';
import 'package:mobdev_midterm/constants.dart';
import 'package:mobdev_midterm/models/question_model.dart';
// import 'package:mobdev_midterm/screens/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:mobdev_midterm/screens/home.dart';
import 'package:mobdev_midterm/widgets/trivia/next_button.dart';
import 'package:mobdev_midterm/widgets/trivia/option_card.dart';
import 'package:mobdev_midterm/widgets/trivia/question_widget.dart';
import 'dart:convert';
import 'package:mobdev_midterm/widgets/trivia/result_box.dart';
import 'package:html_unescape/html_unescape.dart';

class TriviaScreen extends StatefulWidget {
  static const String routeName = "triviaScreen";
  const TriviaScreen({super.key});

  @override
  State<TriviaScreen> createState() => _TriviaScreenState();
}

class _TriviaScreenState extends State<TriviaScreen> {
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

  late Future _questions;

  @override
  void initState() {
    _questions = fetchTriviaQuestions();
    super.initState();
  }

  // to loop through questions
  int index = 0;
  // tracks user score
  int score = 0;
  // check if user has clicked
  bool isPressed = false;
  bool isAlreadySelected = false;
  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      // when there is no more questions
      showDialog(
          context: context,
          barrierDismissible:
              false, // this will disable the dissmis function on clicking outside of box
          builder: (ctx) => ResultBox(
                result: score, // total points the user got
                questionLength: questionLength, // out of how many questions
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      ModalRoute.withName('/triviaScreen'));
                },
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(String value, String correctAnswer) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == correctAnswer) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<TriviaQuestion>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<TriviaQuestion>;
            var unescape = HtmlUnescape();

            return Scaffold(
              backgroundColor: primary,
              appBar: AppBar(
                title: const Text('Quiz App'),
                backgroundColor: secondary,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Score: $score',
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    QuestionWidget(
                      indexAction: index,
                      question: extractedData[index].question =
                          unescape.convert(extractedData[index].question),
                      totalQuestions: extractedData.length,
                    ),
                    const Divider(color: Colors.white),
                    const SizedBox(height: 25.0),
                    for (int i = 0;
                        i < extractedData[index].options.length;
                        i++)
                      GestureDetector(
                        onTap: () => checkAnswerAndUpdate(
                            extractedData[index].options.toList()[i],
                            extractedData[index].correctAnswer),
                        child: OptionCard(
                          option: extractedData[index].options.toList()[i],
                          color: isPressed
                              ? (extractedData[index].options[i] ==
                                      extractedData[index].correctAnswer
                                  ? correct
                                  : incorrect)
                              : Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: NextButton(// the above function
                      ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20.0),
                Text(
                  'Please Wait while Questions are loading..',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          );
        }

        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
