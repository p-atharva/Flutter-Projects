import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/questions_sc.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedOption = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void choosenAns(String answer) {
    selectedOption.add(answer);
    if (selectedOption.length == allQuestions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedOption = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenW = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenW = QuestionSc(onSelect: choosenAns);
    }

    if (activeScreen == 'result-screen') {
      screenW = ResultScreen(
        chosenAns: selectedOption,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.shade200,
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.teal.shade400),
          trackColor: MaterialStateProperty.all(Colors.teal.shade200),
        ),
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            child: screenW,
          ),
        ),
      ),
    );
  }
}
