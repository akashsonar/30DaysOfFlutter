import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:flutter_app/widgets/item_widget.dart';
import 'package:google_fonts/google_fonts.dart';

//learned about context and constraints

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  hideStatus() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // int days = 30;
    // var name = "Akash";
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cataloge App",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (BuildContext context, int index) => ItemWidget(
                        item: CatalogModel.items[index],
                      ))
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        drawer: const MyDrawer());
  }
}
