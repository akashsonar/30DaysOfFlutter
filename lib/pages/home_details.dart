import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
          Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image.toString()).h32(context)),
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
                          .make(),
                      catalog.description!.text
                          .textStyle(
                              TextStyle(color: Colors.black.withOpacity(0.5)))
                          .xl
                          .center
                          .make(),
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
