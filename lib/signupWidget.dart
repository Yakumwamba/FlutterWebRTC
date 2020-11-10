import 'dart:convert';

import 'package:Trend/data/streaminfo.dart';
import 'package:Trend/login.dart';
import 'package:Trend/trend_icons_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:get_storage/get_storage.dart';


class EmailSignUpWidget extends StatefulWidget {
  const EmailSignUpWidget({
    Key key,
  }) : super(key: key);

  @override
  _EmailSignUpWidgetState createState() => _EmailSignUpWidgetState();
}

class _EmailSignUpWidgetState extends State<EmailSignUpWidget> {
  //GetStorage box = GetStorage();

  // String your_client_id = "381667702819164";
  // String redirect_url = "https://www.facebook.com/connect/login_success.html";

  StreamInfo info = Get.find();
  final _auth = FirebaseAuth.instance;

  final databaseReference = FirebaseFirestore.instance;

  GetStorage box = GetStorage();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _success;
  String _userEmail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
// @override
// void initState() {
  // super.initState();
  // if(  box.read("logged_in") == "true") {
  //  // info.getTrackInfo();
  //   Get.to(TermsAndConditions());
  // }
  //    info.getTrackInfo();
// }

  void _register() async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      if (user != null) {
        print("the user id generated is : ");
        print(user.uid);

        await databaseReference.collection("users").doc(user.uid).set({
          'fullname': _fullName.text,
        });

        user.updateProfile(displayName: "Test Display Name");
        Get.snackbar("Congratualtions", "Your account is ready");
        Get.to(LoginScreen());
      } else {}
    } catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // box.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(bottom: 60.0),
                        child: Text(
                          "Create account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 33,
                              color: Colors.white),
                        ),
                      )),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _fullName,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "field cannot be empty";
                              }
                            },
                            decoration: InputDecoration(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left : 10.0),
                                  child: Icon(
                                    
                                    TrendIcons.trend_user,
                                    size: 20,
                                  
                                    color: Colors.orange,
                                  ),
                                ),
                                
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                hintText: 'Full Name',
                                contentPadding:
                                    EdgeInsets.only(left: 56, bottom: 13)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _emailController,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Email required";
                              }
                            },
                            decoration: InputDecoration(
                                icon: Padding(
                                   padding: const EdgeInsets.only(left : 10.0),
                                  child: Icon(
                                    TrendIcons.email_icon,
                                    size: 19,
                                    color: Colors.orange,
                                  ),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                hintText: 'Email',
                                contentPadding:
                                    EdgeInsets.only(left: 70, bottom: 13)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Password required";
                              }
                            },
                            decoration: InputDecoration(
                                icon: Padding(
                                   padding: const EdgeInsets.only(left : 10.0),
                                  child: Icon(
                                    TrendIcons.lock,
                                    size: 25,
                                    color: Colors.orange,
                                  ),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                hintText: 'Password',
                                contentPadding:
                                    EdgeInsets.only(left: 50, bottom: 13)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            obscureText: true,
                            validator: (val) {
                              if (val != _passwordController.text ||
                                  val.isEmpty) {
                                return "Passwords do not match";
                              }
                            },
                            decoration: InputDecoration(
                                icon: Padding(
                                    padding: const EdgeInsets.only(left : 10.0),
                                  child: Icon(
                                    TrendIcons.lock,
                                    size: 25,
                                    color: Colors.orange,
                                  ),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                hintText: 'Confirm Password',
                                contentPadding:
                                    EdgeInsets.only(left: 30, bottom: 13)),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            print("validated");
                            _register();
                            return;
                          }
                          print("Invalid inputs");
                        },
                        splashColor: Colors.white12,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xfff79f00),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          child: Center(
                              child: Text(
                            "Create Account",
                            style: TextStyle(
                              color: Color(0xff262626),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Container(
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Opacity(
                                opacity: 0.4,
                                child: Text(
                                  "By continuing you agree with our",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Opacity(
                                opacity: 0.6,
                                child: Text(
                                  "Terms of use",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
