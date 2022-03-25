import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/login_image.png",
            fit: BoxFit.fill,
            height: 400,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Welcome",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 28, color: Colors.black),
          ),
          const SizedBox(height: 30.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: "Enter username",
                    labelText: "User Name",
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: const Text("Login"),
                    style:
                        TextButton.styleFrom(minimumSize: const Size(150, 40)))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
