import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../widgets/coffee_carousel_widget.dart';
import '../../widgets/coffee_cards/item_coffee_card.dart';
import '../../widgets/coffee_cards/new_coffee_card.dart';
import '../../widgets/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _future = Supabase.instance.client.from('products').select();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final products = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
                itemCount: products.length,
                itemBuilder: ((context, index) {
                  final product = products[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TitleText(title: "Item"),
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
                    TitleText(title: "New"),
                    NewCoffeeCard(
                      title: product['title'],
                      description:product['description'],
                      link: product['image_url'],
                    ),
                    // TitleText(title: "Popular"),
                    // CoffeeCarousel(),
                  ],
                );
              }
            )),
          );
        },
      ),
    );
  }
}
