import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                width: MediaQuery.of(context).size.width*2,
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: const BoxDecoration(
                  color: Color(0xFFD2A679), // coffee brown
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
                Text(
                  widget.title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),

                ConstrainedBox(
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
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ),

                // Quantity selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      color: Colors.brown,
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Text(
                      "$quantity",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      color: Colors.brown,
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
                    CoffeeSizeButton(size: 40,),
                    CoffeeSizeButton(size: 45,),
                    CoffeeSizeButton(size: 50,),

                  ],
                ),
                ElevatedButton(onPressed: (){

                }, child: Text("Add to cart"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeSizeButton extends StatelessWidget {
  final double size;
  const CoffeeSizeButton({
    super.key,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: IconButton.outlined(
          iconSize: size,
          onPressed: () {},
          icon: Icon(Icons.coffee),
        ),
      ),
    );
  }
}
