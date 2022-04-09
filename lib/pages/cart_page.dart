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
        title:
            "Cart".text.color(Theme.of(context).colorScheme.error).xl3.make(),
        backgroundColor: Colors.transparent,
        systemOverlayStyle: AppBarTheme.of(context).systemOverlayStyle,
      ),
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        "\$9999".text.xl5.color(Theme.of(context).colorScheme.error).make(),
        30.widthBox,
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.onBackground)),
                onPressed: () {},
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.done),
          title: "item 1".text.make(),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.remove_circle_outline)),
        );
      },
    );
  }
}
