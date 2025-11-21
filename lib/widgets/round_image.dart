import 'package:flutter/material.dart';

class CircularAssetImage extends StatelessWidget {
  final String link;
  const CircularAssetImage({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child:
      Image.asset(
        link,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CircularNetworkImage extends StatelessWidget {
  final String link;
  const CircularNetworkImage({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child:
      Image.network(
        link,
        fit: BoxFit.cover,
      ),
    );
  }
}
