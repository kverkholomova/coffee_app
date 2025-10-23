import 'package:coffee_app/widgets/round_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCoffeeCard extends StatelessWidget {
  final String title;
  final String link;

  const ItemCoffeeCard({super.key, required this.title, required this.link});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double cardWidth = constraints.maxWidth; // width the parent allows
          double cardHeight = cardWidth * 1.4; // make height larger than width
          double imageSize = cardWidth * 0.7;      // 60% of card width
          double borderRadius = cardWidth / 2;   // 20% of card width
          double padding = cardWidth * 0.1;        // 10% of card width
          double fontSize = cardWidth * 0.12;      // dynamic text size
          return Card(
            margin: EdgeInsets.all(padding / 2),
            color: const Color.fromRGBO(255, 241, 232, 1.0),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 1.5, color: Color.fromRGBO(109, 82, 62, 1.0)),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: const Color.fromRGBO(109, 82, 62, 1.0),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: padding,
                    horizontal: padding
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: imageSize,
                      height: imageSize,
                      child: CircularImage(link: link),
                    ),
                    SizedBox(height: padding / 2),
                    Text(
                      title.toUpperCase(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

