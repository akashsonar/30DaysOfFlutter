import 'package:flutter/material.dart';
import 'package:flutter_app/pages/homePage.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

import 'pages/login_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
   const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark, 
      //set brightness for icons, like dark background light icons
   )
);
  runApp(const FlutterPractice());
}

class FlutterPractice extends StatelessWidget {
  const FlutterPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: GoogleFonts.poppins().fontFamily),
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage()
      },
    );
  }
}
