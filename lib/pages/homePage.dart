import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  hideStatus() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
  }

  @override
  Widget build(BuildContext context) {
    int days = 30;
    var name = "Akash";
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
        body: Center(
            child: Text(
          "Welcome to $days days of Flutter with $name",
          // ignore: prefer_const_constructors
          style: const TextStyle(
              color: Colors.teal, fontSize: 20, fontWeight: FontWeight.bold),
        )),
        drawer: const MyDrawer());
  }
}
