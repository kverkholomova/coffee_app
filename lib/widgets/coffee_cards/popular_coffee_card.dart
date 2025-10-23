import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularCoffeeCard extends StatelessWidget {
  final String name;
  final String link;
  final String price;

  const PopularCoffeeCard({required this.name, required this.link, required this.price, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3/2,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: InkWell(
          splashColor: const Color.fromRGBO(109, 82, 62, 1.0),
          onTap: () {
            debugPrint('Card tapped');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: 1/1,
                  child: Image.asset(link, fit: BoxFit.cover,)),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  name,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.w800, // Extra bold
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  price,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
