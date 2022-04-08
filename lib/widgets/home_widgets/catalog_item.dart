import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/themes.dart';

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
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => const Icon(
                            Icons.running_with_errors_outlined,
                            semanticLabel: "Error Can't load Image")))
                .box
                .p8
                .rounded
                .color(MyTheme.creamColor)
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
                .color(Vx.lightBlue900)
                .make(),
            catalog.description!.text
                .overflow(TextOverflow.ellipsis)
                .maxLines(3)
                .medium
                .make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.m0,
              children: [
                "\$ ${catalog.price}".text.lightBlue700.lg.bold.make(),
                ElevatedButton(
                    onPressed: () {},
                    child: "add to cart".text.sm.fontFamily(GoogleFonts.montserrat().fontFamily!).capitalize.make(),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Vx.lightBlue900),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())))
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).white.roundedSM.square(150).make().py16();
  }
}
