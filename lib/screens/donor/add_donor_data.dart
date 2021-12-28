import 'package:flutter/material.dart';

import '../../style.dart';

class AddDonorData extends StatelessWidget {
  // const AddDonorData({Key? key}) : super(key: key);
  static String id = '/AddDonorData';
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final lastDonateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Blood Donation Form"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 30, 40, 10),
          child: ListView(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/user-image.png',
                        height: 120,
                      ),
                      Positioned(
                          top: 25,
                          left: 80,
                          // right: -20,
                          child: Icon(
                            Icons.upload,
                            size: 40,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
              Text(
                "Full Name",
                style: ktextlabel,
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Name")),
              SizedBox(
                height: 10,
              ),
              Text(
                "Mobile Number",
                style: ktextlabel,
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: mobileController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Mobile Number")),
              SizedBox(
                height: 10,
              ),
              Text(
                "Blood Group",
                style: ktextlabel,
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                  controller: bloodGroupController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Select Blood Group")),
              SizedBox(
                height: 10,
              ),
              Text(
                "Last Donated Date ",
                style: ktextlabel,
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Select Date")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10), shape: StadiumBorder()),
                  onPressed: () {},
                  child: Text(
                    "Add Me",
                    style: kbuttonText,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
