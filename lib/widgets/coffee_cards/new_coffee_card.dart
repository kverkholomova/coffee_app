import 'package:coffee_app/widgets/round_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCoffeeCard extends StatelessWidget {
  final String title;
  final String description;
  final String link;

  const NewCoffeeCard({super.key, required this.title, required this.link, required this.description});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double cardWidth = constraints.maxWidth; // width the parent allows
          double imageSize = cardWidth * 0.6;      // 60% of card width
          double borderRadius = cardWidth * 0.2;   // 20% of card width
          double padding = cardWidth * 0.1;        // 10% of card width
          double fontSize = cardWidth * 0.04;      // dynamic text size
          return Card(
            margin: EdgeInsets.all(padding / 2),
            color: const Color.fromRGBO(239, 203, 176, 1.0),
            shape: RoundedRectangleBorder(
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
                    vertical: padding, horizontal: padding),
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                        SizedBox(
                          width: 100,
                          child: Text(
                            description,
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: fontSize,
                              color: Theme.of(context).textTheme.bodyMedium?.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        width: imageSize,
                        height: imageSize,
                        child: CircularImage(link: link),
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

