import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPageCategories extends StatelessWidget {
  final String title;
  const SearchPageCategories({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: InkWell(
        splashColor: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
        onTap: () {
          debugPrint('Card tapped');
        },
        child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600, // Extra bold
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ),

      ),
    );
  }
}
