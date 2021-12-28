// ignore_for_file: prefer_const_constructors

import 'package:crud_application/screens/auth/login_screen.dart';
import 'package:crud_application/screens/auth/register_screen.dart';
import 'package:crud_application/screens/donor/home_screen.dart';
import 'package:crud_application/services/auth_service.dart';
import 'package:crud_application/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = "/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            InteractiveViewer(
                // maxScale: 2.5,
                // boundaryMargin: EdgeInsets.all(double.infinity),
                child: Image.asset(
              "assets/images/logo.png",
              height: 150,
            )),
            SizedBox(
              height: 10,
            ),
            Center(child: Text("Login User",style: kHeading,)),
            SizedBox(
              height: 10,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              // margin: EdgeInsets.all(10),
              color: Colors.white,
              elevation: 5.0,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            // for login screen
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Checkerbox(), Text("Forget passwprd?")],
            ),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (emailController.text == '' ||
                      passwordController.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Required Field")));
                  } else {
                    User? result = await AuthService().loginUser(
                        emailController.text, passwordController.text, context);
                    if (result != null) {
                      emailController.clear();
                      passwordController.clear();
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.id, (route) => false);
                    }
                  }
                },
                child: Text("Login")),
            SizedBox(
              height: 20,
            ),
            Center(
                child: InkWell(
              onTap: () => {Navigator.pushNamed(context, RegisterScreen.id)},
              child: RichText(
                  text: TextSpan(
                      text: "Don't Have an account?\t",
                      style: TextStyle(color: Colors.black, fontSize: 21),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                    TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 21,
                            fontWeight: FontWeight.bold))
                  ])),
            ))
          ],
        ),
      ),
    );
  }
}

class Checkerbox extends StatefulWidget {
  const Checkerbox({Key? key}) : super(key: key);

  @override
  _CheckerboxState createState() => _CheckerboxState();
}

class _CheckerboxState extends State<Checkerbox> {
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            activeColor: Colors.red,
            checkColor: Colors.white,
            value: isRemember,
            onChanged: (value) {
              setState(() {
                isRemember = value!;
              });
            }),
        Text("Remember")
      ],
    );
  }
}
