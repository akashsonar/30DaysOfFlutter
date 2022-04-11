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
          const _CartList().p32().expand(),
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
        "\$${_cart.totalPrice}".text.xl5.color(Theme.of(context).colorScheme.error).make(),
        30.widthBox,
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.onBackground)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: "Feature coming soon !!"
                        .text
                        .color(Colors.black)
                        .make(),
                    duration: const Duration(seconds: 1),
                  ));
                },
                child: "Buy Now"
                    .text
                    .color(Theme.of(context).colorScheme.onSurface)
                    .make())
            .w32(context)
      ]),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Icon(Icons.done, color: Theme.of(context).colorScheme.error),
          title:
              _cart.items[index].title!.text.make(),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.remove_circle_outline,
                  color: Theme.of(context).colorScheme.error)),
        );
      },
    );
  }
}
