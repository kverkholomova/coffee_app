import 'package:coffee_app/widgets/category_carousel_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_style.dart';
import '../../widgets/coffee_carousel_widget.dart';
import '../../widgets/categories_widget.dart';
import '../../widgets/bar_widgets/search_bar.dart';
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
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),

              Center(
                child: CustomElevatedButton(
                  cardWidth: MediaQuery.of(context).size.width * 0.6,
                  title: "More",
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w400, textColor: Theme.of(context).brightness ==
                    Brightness.light
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).primaryColorDark, backgroundColor: Theme.of(context).brightness ==
                    Brightness.light
                    ? Theme.of(context).primaryColorDark
                    : Theme.of(context).primaryColorLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
