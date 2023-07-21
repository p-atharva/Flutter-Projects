import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionGen extends StatelessWidget {
  const OptionGen({
    super.key,
    required this.optionText,
    required this.onTapped,
  });

  final String optionText;
  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Theme.of(context).colorScheme.surfaceTint,
      child: InkWell(
        splashColor: Colors.tealAccent.shade400,
        onTap: onTapped,
        child: SizedBox(
          width: 350,
          height: 50,
          child: Center(
            child: Text(
              optionText,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
