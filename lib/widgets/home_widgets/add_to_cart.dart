import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/store.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          AddMutation(catalog);
          // setState(() {});
        },
        child: isInCart
            ? Icon(Icons.done_rounded,
                color: Theme.of(context).colorScheme.onSurface)
            : Icon(CupertinoIcons.cart_badge_plus,
                color: Theme.of(context).colorScheme.onSurface)
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
