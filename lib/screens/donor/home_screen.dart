import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'font_awe';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(
          children: [Container(
            child: Row(
              children: [
               FaIcon(IconData())
              ],
            ),
          )],
        ),
      ),
    );
  }
}
