import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../features/main_pages/product_page.dart';

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

class CoffeeDescription extends StatelessWidget {
  final Color color;
  const CoffeeDescription({
    super.key,
    required this.widget,
    required this.color,
  });

  final ProductPage widget;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Text(
        widget.description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: GoogleFonts.montserrat(
          fontSize: MediaQuery.of(context).size.width * 0.03,
          color: color,
        ),
      ),
    );
  }
}

class CoffeeTitle extends StatelessWidget {
  final Color color;
  const CoffeeTitle({super.key, required this.widget, required this.color});

  final ProductPage widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title.toUpperCase(),
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: MediaQuery.of(context).size.width * 0.07,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}