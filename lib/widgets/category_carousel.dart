import 'package:flutter/material.dart';

import 'categories_widget.dart';

class CategoryCarousel extends StatefulWidget {
  @override
  _CategoryCarouselState createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.65);
  final List<String> categories = ["All", "Hot Coffee", "Cold Coffee", "Cappuccino"  ];


  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.1,
      child: PageView.builder(
        padEnds: false,
        controller: _controller,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return SearchPageCategories(title:categories[index],);
        }),
    );
  }
}
