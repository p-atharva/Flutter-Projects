import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/result_summary/ques_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAns, required this.onRestart});

  final void Function() onRestart;
  final List<String> chosenAns;

  List<Map<String, Object>> getResultSummary() {
    final List<Map<String, Object>> resultSummary = [];

    for (var i = 0; i < chosenAns.length; i++) {
      resultSummary.add({
        'question_index': i,
        'question': allQuestions[i].question,
        'correct_answer': allQuestions[i].options[0],
        'chosen_answer': chosenAns[i],
      });
    }
    return resultSummary;
  }

  @override
  Widget build(BuildContext context) {
    final quizSummary = getResultSummary();
    final totalQues = allQuestions.length;
    final correctQues = quizSummary.where((data) {
      return data['chosen_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctQues out of $totalQues correctly!',
              style: GoogleFonts.poppins(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuesSummary(quizSummary),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
