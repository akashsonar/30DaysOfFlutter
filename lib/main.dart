import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterPractice());
}

class FlutterPractice extends StatelessWidget {
  const FlutterPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Material(
            child: Center(child: Text("Welcome to 30 days of Flutter"))));
  }
}
