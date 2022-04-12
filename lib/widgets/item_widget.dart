import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          // print('${item.title} is pressed');
        },
        leading: Image.network(item.image.toString(),),
        title: Text(item.title.toString()),
        subtitle: Text(item.description.toString()),
        trailing: Text(
          "\$${item.price}",
          style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily),
          textScaleFactor: 1.4,
        ),
      ),
    );
  }
}
