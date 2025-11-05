import 'package:flutter/material.dart';

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
