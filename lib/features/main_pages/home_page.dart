

import 'package:flutter/material.dart';

import '../../widgets/coffee_carousel_widget.dart';
import '../../widgets/coffee_cards/item_coffee_card.dart';
import '../../widgets/coffee_cards/new_coffee_card.dart';
import '../../widgets/text_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText(title: "Item",),
            Row(
              children: [
                ItemCoffeeCard(
                  title: "hot coffee",
                  link: "assets/hot_coffee.jpg",
                ),
                ItemCoffeeCard(
                  title: "cold coffee",
                  link: "assets/cold_coffee.jpg",
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
              link: "assets/iced-coffee.png",
            ),
            TitleText(title: "Popular",),
            CoffeeCarousel()
          ],
        ),
      ),
    );
  }
}

