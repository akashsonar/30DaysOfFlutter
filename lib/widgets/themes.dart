import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      // primarySwatch: Colors.teal,
      colorScheme: Theme.of(context).colorScheme.copyWith(
          secondary: darkBluishColor,
          primary: Vx.lightBlue900,
          onSecondary: Vx.white,
          background: Vx.black,
          onBackground: Vx.teal600,
          onSurface: Vx.white,
          onPrimaryContainer: Vx.teal600,
          onError: Vx.white,
          error: Vx.black,
          inversePrimary: Colors.transparent,
          surface: Colors.transparent,
          inverseSurface: Vx.white,
          onTertiary: Colors.white),
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          color: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      // primarySwatch: Colors.teal,
      colorScheme: Theme.of(context).colorScheme.copyWith(
          secondary: Vx.white,
          primary: Vx.black,
          onPrimary: Vx.gray600,
          onSecondary: Vx.gray400,
          background: Vx.teal600,
          onBackground: Vx.teal600,
          onSurface: Vx.white,
          onPrimaryContainer: Vx.white,
          onError: Vx.black,
          error: Vx.white,
          inversePrimary: Vx.black,
          surface: Vx.gray300,
          inverseSurface: Vx.black,
          onTertiary: Colors.white),
      cardColor: Colors.black,
      canvasColor: darkGreyColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Vx.teal600),
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          color: Colors.grey.shade900,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          // toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6));

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkGreyColor = Vx.gray900;
  static Color darkBluishColor = Colors.blue.shade900;
  static Color darkPurple = Vx.purple400;
}
