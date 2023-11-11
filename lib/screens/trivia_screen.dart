import 'package:flutter/material.dart';
import 'package:mobdev_midterm/constants.dart';
import 'package:mobdev_midterm/models/question_model.dart';
import 'package:mobdev_midterm/screens/dashboard.dart';
import 'package:mobdev_midterm/screens/trivia_detail_screen.dart';
import 'package:http/http.dart' as http;
import 'package:mobdev_midterm/widgets/trivia/next_button.dart';
import 'package:mobdev_midterm/widgets/trivia/option_card.dart';
import 'package:mobdev_midterm/widgets/trivia/question_widget.dart';
import 'dart:convert';

import 'package:mobdev_midterm/widgets/trivia/result_box.dart';

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
      // this is the block where the questions end.
      showDialog(
          context: context,
          barrierDismissible:
              false, // this will disable the dissmis function on clicking outside of box
          builder: (ctx) => ResultBox(
                result: score, // total points the user got
                questionLength: questionLength, // out of how many questions
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++; // when the index will change to 1. rebuild the app.
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

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    // Navigator.pop(context);
    Navigator.pushReplacementNamed(context, Dashboard.routeName);
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
    // use the FutureBuilder Widget
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
            var options = extractedData[index].incorrectAnswers;
            options.add(extractedData[index].correctAnswer);
            options.shuffle();
            print(options);

            return Scaffold(
              // change the background
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
                    // add the questionWIdget here
                    QuestionWidget(
                      indexAction: index, // currently at 0.
                      question: extractedData[index]
                          .question, // means the first question in the list.
                      totalQuestions:
                          extractedData.length, // total length of the list
                    ),
                    const Divider(color: Colors.white),
                    // add some space
                    const SizedBox(height: 25.0),
                    for (int i = 0;
                        i < extractedData[index].incorrectAnswers.length;
                        i++)
                      GestureDetector(
                        onTap: () => checkAnswerAndUpdate(options.toList()[i],
                            extractedData[index].correctAnswer),
                        child: OptionCard(
                          option: options.toList()[i],
                          color: isPressed
                              ? extractedData[index]
                                          .incorrectAnswers
                                          .toList()[i] ==
                                      true
                                  ? correct
                                  : incorrect
                              : Colors.white,
                        ),
                      ),
                  ],
                ),
              ),

              // use the floating action button
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

// class TriviaScreen extends StatefulWidget {
//   static const String routeName = "triviaScreen";

//   const TriviaScreen({super.key});
//   @override
//   // ignore: library_private_types_in_public_api
//   _TriviaScreenState createState() => _TriviaScreenState();
// }

// class _TriviaScreenState extends State<TriviaScreen> {
//   late Future<List<TriviaQuestion>> futureQuestions;

//   @override
//   void initState() {
//     super.initState();
//     futureQuestions = fetchTriviaQuestions();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Trivia App'),
//       ),
//       body: Center(
//         child: FutureBuilder<List<TriviaQuestion>>(
//           future: futureQuestions,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return TriviaList(questions: snapshot.data!);
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }

//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }

//   Future<List<TriviaQuestion>> fetchTriviaQuestions() async {
//     final response =
//         await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = json.decode(response.body);
//       final List<Map<String, dynamic>> results = List.from(data['results']);
//       return results.map((json) => TriviaQuestion.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load trivia questions');
//     }
//   }
// }

// class TriviaList extends StatelessWidget {
//   final List<TriviaQuestion> questions;

//   const TriviaList({super.key, required this.questions});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: questions.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(questions[index].question),
//           subtitle: Text('Category: ${questions[index].category}'),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>
//                     TriviaDetailScreen(question: questions[index]),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
