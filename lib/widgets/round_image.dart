import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String link;
  const CircularImage({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        link,
        fit: BoxFit.fitHeight,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Text('Failed to load image');
        },
      ),
    );
  }
}
