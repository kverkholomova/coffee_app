import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: GoogleFonts.montserrat(
        fontSize: 35,
        fontWeight: FontWeight.w800, // Extra bold
        color: Theme.of(context).textTheme.bodyMedium?.color,
      ),
    );
  }
}