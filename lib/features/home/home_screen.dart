import 'package:coffee_app/providers/theme_provider.dart';
import 'package:coffee_app/widgets/coffee_cards/item_coffee_card.dart';
import 'package:coffee_app/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/coffee_cards/new_coffee_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText(title: "Item",),
            Row(
              children: [
                ItemCoffeeCard(
                  title: "hot coffee",
                  link: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUBRF74tHzNAxEU_vuCz2qJfwRuj61N5ZAF1DN-ss3tif3IjBjFUu64-X3Jm1sec7FHV4&usqp=CAU",
                ),
                ItemCoffeeCard(
                  title: "cold coffee",
                  link: "https://palatesdesire.com/wp-content/uploads/2022/02/iced-coffee-recipe@palates-desire-4.jpg",
                ),
              ],
            ),
            TitleText(title: "New",),

            NewCoffeeCard(
              title: "iced latte",
              description: "a cold coffee drink made with espresso, "
                  "cold milk, and ice, creating a smoother and creamier "
                  "texture than iced coffee. It's a chilled version of a traditional "
                  "latte, prepared by pouring shots of espresso over ice and then "
                  "adding cold milk, often with an optional sweetener "
                  "like a flavored syrup.",
              link: "https://static.vecteezy.com/system/resources/thumbnails/047/732/342/small_2x/iced-coffee-in-plastic-cups-with-straw-transparent-background-png.png",
            ),
            TitleText(title: "Popular",),


          ],
        ),
      ),
    );
  }
}

