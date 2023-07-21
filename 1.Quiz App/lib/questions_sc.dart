import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/option_generator.dart';
import 'package:quiz_app/models/questions.dart';

class QuestionSc extends StatefulWidget {
  const QuestionSc({super.key, required this.onSelect});

  final void Function(String answer) onSelect;

  @override
  State<QuestionSc> createState() => _QuestionScState();
}

class _QuestionScState extends State<QuestionSc> {
  var currentQuesIndex = 0;

  void answerQuestion(String selectedOption) {
    widget.onSelect(selectedOption);
    setState(() {
      currentQuesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQues = allQuestions[currentQuesIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'QUESTION ..',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 5,
          thickness: 2,
          indent: 30,
          endIndent: 30,
          color: Colors.teal,
        ),
        const SizedBox(height: 50),
        Text(
          currentQues.question,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
          softWrap: true,
        ),
        const SizedBox(height: 20),
        ...currentQues.getShuffledOptions().map(
          (item) {
            return OptionGen(
              optionText: item,
              onTapped: () {
                answerQuestion(item);
              },
            );
          },
        ),
      ],
    );
  }
}
