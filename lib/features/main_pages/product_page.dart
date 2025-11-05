import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../widgets/round_image.dart';

class ProductPage extends StatefulWidget {
  final String link;
  final String title;
  final String description;

  const ProductPage({
    super.key,
    required this.link,
    required this.title,
    required this.description,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(600),
                    topRight: Radius.circular(600),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: CircularImage(link: widget.link),
                  ),
                ),
                CoffeeTitle(
                  widget: widget,
                  color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                ),

                CoffeeDescription(
                  widget: widget,
                  color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                ),

                // Quantity selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.outlined(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      iconSize: 30,
                      icon: Icon(
                        Icons.remove,
                        color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                      ),
                      color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "$quantity",
                        style: GoogleFonts.montserrat(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    IconButton.outlined(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      iconSize: 30,

                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                      ),
                      color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CoffeeSizeButton(
                      size: 40,
                      color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                    ),
                    CoffeeSizeButton(
                      size: 45,
                      color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                    ),
                    CoffeeSizeButton(
                      size: 50,
                      color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                      foregroundColor: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorLight:Theme.of(context).primaryColorDark,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // rounded corners
                      ),
                      elevation: 4, // shadow
                    ),
                    child: Text("Add to cart", style:
                    GoogleFonts.montserrat(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Theme.of(context).brightness==Brightness.light?Theme.of(context).primaryColorDark:Theme.of(context).primaryColorLight,
                    )
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeDescription extends StatelessWidget {
  final Color color;
  const CoffeeDescription({
    super.key,
    required this.widget,
    required this.color,
  });

  final ProductPage widget;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Text(
        widget.description,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: GoogleFonts.montserrat(
          fontSize: MediaQuery.of(context).size.width * 0.03,
          color: color,
        ),
      ),
    );
  }
}

class CoffeeTitle extends StatelessWidget {
  final Color color;
  const CoffeeTitle({super.key, required this.widget, required this.color});

  final ProductPage widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title.toUpperCase(),
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: MediaQuery.of(context).size.width * 0.07,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}

class CoffeeSizeButton extends StatelessWidget {
  final double size;
  final Color color;
  const CoffeeSizeButton({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: IconButton.outlined(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: color, width: 1),
          ),
          color: color,
          iconSize: size,
          onPressed: () {},
          icon: Image.asset(
            'assets/coffee_to_go_cup_icon.png', // path in your assets folder
            width: size,
            height: size,
            color: color, // optional: tint the image
          ),
        ),
      ),
    );
  }
}
