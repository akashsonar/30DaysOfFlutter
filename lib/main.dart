import 'package:flutter/material.dart';
import 'package:flutter_app/core/store.dart';
import 'package:flutter_app/pages/cart_page.dart';
import 'package:flutter_app/pages/homePage.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:flutter_app/widgets/themes.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'pages/login_page.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //color set to transperent or set your own color
    statusBarIconBrightness: Brightness.dark,
    //set brightness for icons, like dark background light icons
  ));

  //to disable landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(VxState(store: MyStore(), child: const FlutterPractice()));
}

class FlutterPractice extends StatelessWidget {
  const FlutterPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const HomePage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartRoute: ((context) => const CartPage()),
      },
    );
  }
}
