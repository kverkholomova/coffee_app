import 'package:coffee_app/features/main_pages/product_page.dart';
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
          double borderRadius = cardWidth * 0.05;  // 20% of card width
          double padding = cardWidth * 0.1;        // 10% of card width
          double fontSize = cardWidth * 0.04;      // dynamic text size
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                margin: EdgeInsets.all(padding / 2),
                color: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  splashColor: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => ProductPage(link: link, title: title,description: description,),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: padding, horizontal: padding),
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title.toUpperCase(),
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                fontSize: cardWidth * 0.055,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).textTheme.bodyMedium?.color,
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: cardWidth*0.45),
                              child: Text(
                                description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.montserrat(
                                  fontSize: fontSize,
                                  color: Theme.of(context).textTheme.bodyMedium?.color,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: cardWidth*0.2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -imageSize * 0.2,
                top: cardWidth * 0.05,
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: CircularImage(link: link),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

