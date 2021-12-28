import 'package:crud_application/services/auth_service.dart';
import 'package:crud_application/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_donor_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = "/homeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Container(
                child: const Text('Donor App'),
              ),
            ),
            ListTile(
              onTap: () async {
                await AuthService().userSignOut();
              },
              title: const Text("Logout"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AddDonorData.id);
              },
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: const BoxDecoration(
                    color: Color(0xffcccccc),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.heartbeat,
                          size: 40,
                          color: Colors.red,
                        )),
                    Text("Become a Donor",
                        style: GoogleFonts.alegreyaSansSc(
                          fontSize: 31,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.heartbeat,
                          size: 40,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AddDonorData.id);
              },
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Column(
                    children: [
                      Text(
                        "Be a part of Donor List".toUpperCase(),
                        style: kbannertext,
                      ),
                      Text(
                        "Click Here".toUpperCase(),
                        style: kbannertext1,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
