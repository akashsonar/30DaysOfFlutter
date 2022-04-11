import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
        onPressed: () {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        child: isInCart
            ? Icon(Icons.done_rounded, color: Theme.of(context).colorScheme.onSurface)
            : Icon(CupertinoIcons.cart_badge_plus, color: Theme.of(context).colorScheme.onSurface)
            // "Add to Cart"
            //     .text
            //     .sm
            //     .fontFamily(GoogleFonts.montserrat().fontFamily!)
            //     .color(Theme.of(context).colorScheme.onSurface)
            //     .capitalize
            //     .make()
                ,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onBackground),
            shape: MaterialStateProperty.all(const StadiumBorder())));
  }
}
