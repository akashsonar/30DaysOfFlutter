// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    var name = "Akash";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cataloge App",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Center(
          child: Text(
        "Welcome to $days days of Flutter with $name",
        style: TextStyle(
            color: Colors.blue.shade400,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      )),
      drawer: Drawer(
          child: Column(
        children: [
          Center(
            child: Text(
              "Menu 0",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blue.shade900,
                  height: 3),
            ),
          ),
          Center(
            child: Text(
              "Menu 1",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blue.shade900,
                  height: 2),
            ),
          ),
          Center(
            child: Text(
              "Menu 2",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blue.shade900,
                  height: 2),
            ),
          ),
          Center(
            child: Text(
              "Menu 3",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blue.shade900,
                  height: 2),
            ),
          ),
        ],
      )),
    );
  }
}
