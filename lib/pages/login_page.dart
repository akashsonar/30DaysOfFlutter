import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool conditionMet = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        conditionMet = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        conditionMet = false;
      });
    } else {
      return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Image.asset(
              "assets/images/mountain.png",
              fit: BoxFit.fill,
              height: 400,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome $name",
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  color: Colors.black),
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter username",
                      labelText: "User Name",
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Password must be equal to or greater than 6 digits";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Material(
                    color: Colors.blue.shade600,
                    // shape:
                    //     conditionMet ? BoxShape.circle : BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        width: conditionMet ? 80 : 150,
                        height: 40,
                        alignment: Alignment.center,
                        child: conditionMet
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
