import 'package:flutter/material.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      appBar: AppBar(
        centerTitle: true,
        title:
            "Cart".text.color(Theme.of(context).colorScheme.error).xl3.make(),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: AppBarTheme.of(context).systemOverlayStyle,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        "\$${_cart.totalPrice}"
            .text
            .xl5
            .color(Theme.of(context).colorScheme.error)
            .make(),
        30.widthBox,
        const BuyNow()
            .w32(context)
      ]),
    );
  }
}

class BuyNow extends StatelessWidget {
  const BuyNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.onBackground)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                dismissDirection: DismissDirection.down,
                width: 300,
                content: "Feature coming soon !!"
                    .text
                    .center
                    .color(Theme.of(context).colorScheme.onTertiary)
                    .make(),
                duration: const Duration(seconds: 2),
              ));
            },
            child: "Buy Now"
                .text
                .color(Theme.of(context).colorScheme.onSurface)
                .make());
  }
}

class _CartList extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    if (_cart.items.isEmpty) {
      return "Your Cart is Empty".text.xl3.makeCentered();
    }
     else {
      return ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading:
                Icon(Icons.done, color: Theme.of(context).colorScheme.error),
            title: _cart.items[index].title!.text
                .color(Theme.of(context).colorScheme.error)
                .bold
                .make(),
            trailing: IconButton(
                onPressed: () {
                  _cart.remove(_cart.items[index]);
                },
                icon: Icon(Icons.remove_circle_outline,
                    color: Theme.of(context).colorScheme.error)),

          );
        },
      );
    }
  }
}
