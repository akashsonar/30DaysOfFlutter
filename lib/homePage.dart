import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    var name = "Akash";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cataloge App"),
      ),
      body: Center(
        child: Text("welcome to $days of Flutter with $name"),
      ),
      drawer: const Drawer(
        child: Center(
          child: Text("menu 1"),
        ),
      ),
    );
  }
}
