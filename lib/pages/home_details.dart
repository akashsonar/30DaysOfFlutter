import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      // backgroundColor: Vx.white,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35.0), topLeft: Radius.circular(35.0)),
          color: Vx.lightBlue900,
        ),
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
                        label: "Buy"
                            .text
                            .xl
                            .black
                            .fontFamily(
                                GoogleFonts.montserrat().fontFamily.toString())
                            .make(),
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(Vx.teal100),
                            backgroundColor:
                                MaterialStateProperty.all(Vx.white),
                            shape: MaterialStateProperty.all(
                                const StadiumBorder())))
                    .wh(110, 60)
              ],
            ))
          ],
        ).p8(),
      ),
      // backgroundColor: MyTheme.creamColor,
      body: Column(
        children: [
          catalog.category!.text.capitalize.xl.bold.make().p16(),
          Hero(
            tag: Key(catalog.id.toString()),
            child: CachedNetworkImage(
              // placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: catalog.image.toString(),

              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.running_with_errors_outlined, semanticLabel: "Error Can't load Image"),
              // child: Hero(
              //     tag: Key(catalog.id.toString()),
              //     child: Image.network(catalog.image.toString()).h32(context)),
            ).h32(context),
          ),
          Expanded(
            child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Vx.white,
                  child: Column(
                    children: [
                      catalog.title!.text.medium.xl3.center.bold
                          .color(Colors.black)
                          .make()
                          .p24(),
                      // const SizedBox(height: 20),

                      catalog.description!.text
                          .textStyle(
                              TextStyle(color: Vx.black.withOpacity(0.5)))
                          .xl
                          .maxLines(6)
                          .center
                          .make(),
                      // const SizedBox(height: 20),
                      // "Priegano in d'esse se senza sue non. Dovendo discerniamo di purita di in e, a dinanzi le che riguardando dovendo dio tal. Con si di il non occulta in dio, quali apparire apparire furon gli come il d'esse. Impetrata occulta di iscacciato ci forza. Medesimi con iscacciato convenevole alla manifestamente, non ammirabile che quella merito forse le alli e, bene."
                      //     .text
                      //     // .center
                      //     .xl.center.maxLines(6)
                      //     .textStyle(
                      //         TextStyle(color: Vx.black.withOpacity(0.7)))
                      //     .make().p16()
                      // ElevatedButton(onPressed: null, child: null)
                    ],
                  ).py64(),
                ).p4()),
          )
        ],
      ).safeArea(bottom: false),
    );
  }
}
