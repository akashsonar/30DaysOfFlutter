import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_details.dart';
import '../../models/catalog.dart';
import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          child: CatalogItem(catalog: catalog),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        HomeDetailPage(catalog: catalog)));
          },
        );
      },
      itemCount: CatalogModel.items.length,
    );
  }
}
