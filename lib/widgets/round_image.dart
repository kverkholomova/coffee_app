import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String link;
  const CircularImage({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        link,
        fit: BoxFit.cover,
      ),
    );
  }
}
