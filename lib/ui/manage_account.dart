import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../trend_icons_icons.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 45),
        child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
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
                            TrendIcons.cancel_button,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 60,
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
                                    hintText: 'Howard',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold)),
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
                                    hintText: 'Sinyangwe',
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold)),
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2.0),
                                    hintText: '+44 7730 328595',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold)),
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
                              color: Color(0xff707070)
                            ),
                          ),
                          Divider(
                            color: Color(0xff707070),
                            height: 15,
                            thickness: 0.5,
                            indent: 0,
                            endIndent: 0,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            splashColor: Colors.orangeAccent,
                            hoverColor: Colors.blueAccent,
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/images/facebook.png'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                     Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Facebook",
                                            style: TextStyle(fontSize: 13)),
                                        Text(
                                          "Connected ",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Text("Connected",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.orangeAccent
                                        ),
                                        
                                        )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.orangeAccent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        Text(
                                          "Not Connected ",
                                          style: TextStyle(fontSize: 10),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Text("Disconnected",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                       ))
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
      ),
    );
  }
}
