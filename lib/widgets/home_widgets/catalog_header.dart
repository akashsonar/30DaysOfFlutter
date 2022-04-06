import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        "Catalog App".text.xl5.lightBlue900.bold.make(),
        "Trending Products".text.xl2.lightBlue900.make()
      ],
    );
  }
}