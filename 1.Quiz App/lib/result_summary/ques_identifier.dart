import 'package:flutter/material.dart';

class QuesIdentifier extends StatelessWidget {
  const QuesIdentifier({
    super.key,
    required this.isCorrectAns,
    required this.quesIndex,
  });

  final int quesIndex;
  final bool isCorrectAns;

  @override
  Widget build(BuildContext context) {
    final quesNumber = quesIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAns ? Colors.teal : Colors.orangeAccent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        quesNumber.toString(),
        style: const TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
