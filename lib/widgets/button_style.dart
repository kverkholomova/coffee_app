import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeSizeButton extends StatelessWidget {
  final double size;
  final Color color;
  const CoffeeSizeButton({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: IconButton.outlined(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: color, width: 1),
          ),
          color: color,
          iconSize: size,
          onPressed: () {},
          icon: Image.asset(
            'assets/coffee_to_go_cup_icon.png', // path in your assets folder
            width: size,
            height: size,
            color: color, // optional: tint the image
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.cardWidth,
    required this.title,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    required this.backgroundColor,
  });

  final double cardWidth;
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ), // rounded corners
          ),
          elevation: 4, // shadow
        ),
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: textColor
          ),
        ),
      ),
    );
  }
}