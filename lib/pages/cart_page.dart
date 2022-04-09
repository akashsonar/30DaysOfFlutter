import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBar: AppBar(
        centerTitle: true,
        title: "Cart".text.color(Theme.of(context).colorScheme.error).xl3.make(),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: AppBarTheme.of(context).systemOverlayStyle,
      ),
      body: null,
    );
  }
}
