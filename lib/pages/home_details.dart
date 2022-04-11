import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeDetailPage extends StatefulWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(50, 50),
          child: AppBar(
            title: widget.catalog.category!.text.capitalize
                .color(Theme.of(context).colorScheme.error)
                .xl
                .bold
                .make(),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(35.0), topLeft: Radius.circular(35.0)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Container(
          color: Theme.of(context).colorScheme.inversePrimary,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            // buttonPadding: Vx.m0,
            children: [
              "\$ ${widget.catalog.price}"
                  .text
                  .xl4
                  .white
                  .bold
                  .fontFamily(GoogleFonts.montserrat().fontFamily.toString())
                  .make(),
              Expanded(
                  child: Row(
                children: [
                  ElevatedButton.icon(
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Theme.of(context).colorScheme.onBackground,
                              behavior: SnackBarBehavior.floating,
                              width: 300,
                              dismissDirection: DismissDirection.up,
                              content: "Item added to Cart"
                                  .text
                                  .lg
                                  .center
                                  .color(Theme.of(context).colorScheme.onTertiary)
                                  .make(),
                              duration: const Duration(seconds: 2),
                            ));

                            isInCart = isInCart.toggle();
                            final _catalog = CatalogModel();
                            _cart.catalog = _catalog;
                            _cart.add(widget.catalog);
                            setState(() {});
                          },
                          label: "add to cart"
                              .text
                              .capitalize
                              .lg
                              .black
                              .fontFamily(GoogleFonts.montserrat()
                                  .fontFamily
                                  .toString())
                              .make(),
                          style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Vx.blueGray400),
                              backgroundColor:
                                  MaterialStateProperty.all(Vx.white),
                              shape: MaterialStateProperty.all(
                                  const StadiumBorder())))
                      .wh(160, 60)
                ],
              ))
            ],
          ).p8(),
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: Key(widget.catalog.id.toString()),
            child: CachedNetworkImage(
              imageUrl: widget.catalog.image.toString(),
              errorWidget: (context, url, error) => const Icon(
                  Icons.running_with_errors_outlined,
                  semanticLabel: "Error Can't load Image"),
            ).h32(context),
          ),
          Expanded(
            child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  // color: Vx.white,
                  color: Theme.of(context).colorScheme.onError,
                  child: Column(
                    children: [
                      widget.catalog.title!.text.medium.xl3.center.bold
                          .color(Theme.of(context).colorScheme.error)
                          .make()
                          .p24(),

                      widget.catalog.description!.text
                          .textStyle(
                              TextStyle(color: Vx.black.withOpacity(0.5)))
                          .xl
                          .color(Theme.of(context).colorScheme.error)
                          .maxLines(5)
                          .center
                          .make(),
                    ],
                  ).py64(),
                ).p0()),
          )
        ],
      ).safeArea(bottom: false).pOnly(top: 30),
    );
  }
}
