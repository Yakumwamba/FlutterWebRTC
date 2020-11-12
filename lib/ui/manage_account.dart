
import 'dart:ui';

import 'package:Trend/login.dart';
import 'package:Trend/trend_icons_icons.dart' as Trend;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ManageAccount extends StatelessWidget {
  final GetStorage box = GetStorage();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
              children: [
                
                
                
                Container(
            height: Get.width * 0.80,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.20),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFFf79f00),
                      Color(0XFFe54f4f),
                    ]),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(1000, 70)))),
                Container(
          padding: EdgeInsets.only(left: 16.0, right: 16, top: 40),
          child: Column(children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.010),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            color: Color(0xff707070),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Trend.TrendIcons.cancel_button,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Text(
                            "Manage Account",
                            style: TextStyle(
                                fontFamily: 'Sofia_bold',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff707070)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("First Name:"),
                                TextField(
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      height: 1.0,
                                      color: Colors.black),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      hintText: box.read("firstname"),
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Last Name"),
                                TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: box.read("lastname"),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Phone Number"),
                                TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 2.0),
                                      hintText: '000-000-000',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'We will never share your information with \nanyone, without your permission',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Connected Social Accounts",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff707070)),
                            ),
                            Divider(
                              color: Color(0xff707070),
                              height: 15,
                              thickness: 0.5,
                              indent: 0,
                              endIndent: 0,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {},
                              splashColor: Colors.orangeAccent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset('assets/images/google.png'),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Google",
                                              style: TextStyle(fontSize: 13)),
                                          box.read("loggin_type") == "GOOGLE"
                                              ? Text(
                                                  "Connected ",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.orange),
                                                )
                                              : Text(
                                                  "Not Connected ",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                )
                                        ],
                                      ),
                                    ],
                                  ),
                                  box.read("loggin_type") == "GOOGLE"
                                      ? InkWell(
                                          onTap: () async {
                                            print("Disconnecting from google");
                                           await googleSignIn.signOut();

                                            box.remove("logged_in");
                                            box.remove("username");
                                            box.remove("firstname");
                                            box.remove("lastname");
                                            box.remove("logged_in");
                                            box.remove("email");
                                            box.remove("photoUrl");
                                            box.remove("loggin_type");
                                            Get.to(LoginScreen());
                                          },
                                          child: Text("Disconnect",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Color(0xff707070))),
                                        )
                                      : Text("Disconnected",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.orange))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ]),
        )],
      ),
    );
  }
}
