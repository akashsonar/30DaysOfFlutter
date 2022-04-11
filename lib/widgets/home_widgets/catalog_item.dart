import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            // ignore: avoid_unnecessary_containers
            child: Container(
                    child: CachedNetworkImage(
                        imageUrl: catalog.image.toString(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.running_with_errors_outlined)))
                .box
                .p12
                .rounded
                // .color(MyTheme.creamColor)
                .color(Theme.of(context).colorScheme.onSecondary)
                .make()
                .p16()
                .w32(context)),
        // child: CatalogImage(image: catalog.image.toString())),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.title!.text.medium.bold
                .maxLines(1)
                .overflow(TextOverflow.ellipsis)
                .xl
                .bold
                // .color(Vx.lightBlue900)
                .color(Theme.of(context).colorScheme.secondary)
                .make(),
            catalog.description!.text
                .overflow(TextOverflow.ellipsis)
                .color(Theme.of(context).colorScheme.secondary)
                .maxLines(3)
                .medium
                .make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.m0,
              children: [
                "\$ ${catalog.price}"
                    .text
                    // .lightBlue700
                    .color(Theme.of(context).colorScheme.secondary)
                    .lg
                    .bold
                    .make(),
                _AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    ))
        .color(Theme.of(context).colorScheme.onPrimary)
        .customRounded(const BorderRadius.all(Radius.circular(20)))
        .square(150)
        .make()
        .py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle();
          final _catalog = CatalogModel();
          final _cart = CartModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});
        },
        child: isAdded
            ? const Icon(Icons.done_rounded)
            : "Add to Cart"
                .text
                .sm
                .fontFamily(GoogleFonts.montserrat().fontFamily!)
                .color(Theme.of(context).colorScheme.onSurface)
                .capitalize
                .make(),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                // Vx.lightBlue900
                Theme.of(context).colorScheme.onBackground),
            shape: MaterialStateProperty.all(const StadiumBorder())));
  }
}
