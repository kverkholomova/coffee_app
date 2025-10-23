import 'package:flutter/material.dart';

class PopularCoffeeCard extends StatelessWidget {
  final String name;
  final String link;

  const PopularCoffeeCard({required this.name, required this.link, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
              aspectRatio: 1/1,
              child: Image.asset(link, height: 150, fit: BoxFit.cover,)),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
