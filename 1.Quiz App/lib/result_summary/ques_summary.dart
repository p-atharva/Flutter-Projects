import 'package:flutter/material.dart';
import 'package:quiz_app/result_summary/summ_item.dart';

class QuesSummary extends StatelessWidget {
  const QuesSummary(this.resultSummary, {super.key});

  final List<Map<String, Object>> resultSummary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Scrollbar(
        thumbVisibility: true,
        interactive: true,
        thickness: 4,
        radius: const Radius.circular(8),
        child: SingleChildScrollView(
          child: Column(
            children: resultSummary.map((data) {
              return SummItem(data);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
