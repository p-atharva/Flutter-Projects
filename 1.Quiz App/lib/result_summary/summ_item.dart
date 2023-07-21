import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/result_summary/ques_identifier.dart';

class SummItem extends StatelessWidget {
  const SummItem(this.quesData, {super.key});

  final Map<String, Object> quesData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAns =
        quesData['chosen_answer'] == quesData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuesIdentifier(
            isCorrectAns: isCorrectAns,
            quesIndex: quesData['question_index'] as int,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quesData['question'] as String,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: true,
                ),
                const SizedBox(height: 8),
                Text(
                  quesData['chosen_answer'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.blueGrey[600],
                    fontWeight: FontWeight.w700,
                  ),
                  softWrap: true,
                ),
                Text(
                  'Correct Ans: ${quesData['correct_answer']}',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.deepOrangeAccent[700],
                    fontWeight: FontWeight.w600,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
