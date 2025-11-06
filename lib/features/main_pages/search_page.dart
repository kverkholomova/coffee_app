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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SearchBarApp(),
              SizedBox(height: MediaQuery.of(context).size.width * 0.08),

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
