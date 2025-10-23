import 'package:flutter/material.dart';

import 'coffee_cards/popular_coffee_card.dart';

class CoffeeCarousel extends StatefulWidget {
  @override
  _CoffeeCarouselState createState() => _CoffeeCarouselState();
}

class _CoffeeCarouselState extends State<CoffeeCarousel> {
  final PageController _controller = PageController(viewportFraction: 0.65);
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (index) => 'Cappuccino');

    return SizedBox(
      height: 350,
      child: PageView.builder(
        controller: _controller,
        itemCount: items.length,
        itemBuilder: (context, index) {
          double scale = _currentPage == index ? 1.0 : 0.85;

          return TweenAnimationBuilder(
            duration: Duration(milliseconds: 150),
            tween: Tween<double>(begin: scale, end: scale),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: PopularCoffeeCard(),
          );
        },
      ),
    );
  }
}
