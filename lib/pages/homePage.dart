import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/store.dart';
import 'package:flutter_app/models/cart.dart';
import 'package:flutter_app/models/catalog.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
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
    ));
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // to fetch data from the internet

    await Future.delayed(const Duration(seconds: 1));
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final decodeData = jsonDecode(response.body);
    CatalogModel.items =
        List.from(decodeData).map<Item>((e) => Item.fromMap(e)).toList();
    setState(() {});

    //for static data

    // var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    // var decodeData = jsonDecode(catalogJson);
    // var productsData = decodeData["products"];
    // CatalogModel.items = List.from(productsData)
    //     .map<Item>((item) => Item.fromMap(item))
    //     .toList();

  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, _, status) => FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          child: const Icon(CupertinoIcons.cart, size: 26, color: Vx.white),
        ).badge(
            count: _cart.items.count(),
            textStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 10),
            position: VxBadgePosition.rightTop,
            color: Theme.of(context).colorScheme.outline,
            size: 20),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
        ),
      ),
      body: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              (CatalogModel.items.isNotEmpty
                  ? const CatalogList().py16().expand()
                  : CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.background,
                    ).centered().expand())
            ],
          )),
    );
  }
}
