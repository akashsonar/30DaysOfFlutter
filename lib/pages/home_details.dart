import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:cached_network_image/cached_network_image.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(50, 50),
          child: AppBar(
            title: catalog.category!.text.capitalize.color(Theme.of(context).colorScheme.error).xl.bold.make(),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            // systemOverlayStyle: ,
          )),
      // backgroundColor: Vx.white,
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
              "\$ ${catalog.price}"
                  .text
                  .xl4
                  .white
                  .bold
                  .fontFamily(GoogleFonts.montserrat().fontFamily.toString())
                  .make(),
              // ElevatedButton.icon(
              //     icon: const Icon(
              //       Icons.shopping_cart_outlined,
              //       // color: Colors.pink,
              //       size: 24.0,
              //     ),
              //     onPressed: () {},
              //     label: "add to cart".text.xl.make(),
              //     style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all(Vx.teal600),
              //         shape: MaterialStateProperty.all(const StadiumBorder()))),
              Expanded(
                  child: Row(
                children: [
                  ElevatedButton.icon(
                          icon: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          onPressed: () {},
                          label: "add to cart"
                              .text.capitalize
                              .lg
                              .black
                              .fontFamily(
                                  GoogleFonts.montserrat().fontFamily.toString())
                              .make(),
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Vx.blueGray400),
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
      // backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // catalog.category!.text.capitalize.color(context.accentColor).xl.bold.make().pOnly(bottom: 50),
          Hero(
            tag: Key(catalog.id.toString()),
            child: CachedNetworkImage(
              // placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: catalog.image.toString(),
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
                      catalog.title!.text.medium.xl3.center.bold
                          // .color(Colors.black)
                          .color(Theme.of(context).colorScheme.error)
                          .make()
                          .p24(),
                      // const SizedBox(height: 20),

                      catalog.description!.text
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
