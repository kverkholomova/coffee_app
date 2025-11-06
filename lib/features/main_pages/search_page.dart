import 'package:coffee_app/widgets/category_carousel.dart';
import 'package:flutter/material.dart';

import '../../widgets/carousel_widget.dart';
import '../../widgets/categories_widget.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/text_style.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchBarApp(),
              CategoryCarousel(),
              TitleText(title: "Popular"),
              CoffeeCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
