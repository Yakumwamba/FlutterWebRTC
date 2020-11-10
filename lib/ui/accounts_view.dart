import 'package:Trend/data/streaminfo.dart';
import 'package:Trend/login.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../TermsAndConditions.dart';
import 'package:Trend/ui/manage_account.dart';

import 'package:Trend/trend_icons_icons.dart' as Trend;
class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  StreamInfo info = Get.find();
  GetStorage box = GetStorage();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Route _createRoute(Widget route) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInExpo;
        var curve2 = Curves.linearToEaseOut;
        var curve3 = Curves.fastLinearToSlowEaseIn;

        var tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: curve))

            // .chain(CurveTween(curve: curve2))
            .chain(CurveTween(curve: curve2));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // String _text = authState.getDisplayName;
    // String _email = authState.getEmailAddress;
    // String _url = authState.getImageUrl;

    return Scaffold(
      body: Stack(children: <Widget>[
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
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 20),
          child: Container(
            padding: EdgeInsets.only(top: 15),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Stack(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Account",
                            style: TextStyle(
                                fontFamily: 'Sofia_bold',
                                fontSize: 20,
                                color: Color(0xff707070)),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                height: 72,
                                width: 72,
                                imageUrl: box.read("photoUrl") == null
                                    ? ""
                                    : box.read("photoUrl"),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Text(
                            box.read("username") == null
                                ? "Username"
                                : box.read("username"),
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff707070)),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            box.read("email") == null
                                ? "Email"
                                : box.read("email"),
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff707070)),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: IconButton(
                          color: Color(0xff707070),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Trend.TrendIcons.cancel_button,
                            size: 20,
                          ),
                        )),
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(_createRoute(ManageAccount()));

                      //   Get.to(ManageAccount());
                    },
                    child: Container(
                      padding: EdgeInsets.all(18),
                      color: Color(0xFFfafafa),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Manage Account",
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.left,
                          ),
                          Icon(Trend.TrendIcons.forwad_button,
                              size: 15, color: Color(0xfff79f00))
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(18),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Get in touch",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Icon(Trend.TrendIcons.forwad_button,
                            color: Color(0xfff79f00), size: 15)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Get.to(TermsAndConditions());
                    },
                    child: Container(
                      padding: EdgeInsets.all(18),
                      color: Color(0xFFfafafa),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Terms & Conditions"),
                          Icon(Trend.TrendIcons.forwad_button,
                              color: Color(0xfff79f00), size: 15)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () async {
                      if (box.read("loggin_type") == "GOOGLE") {
                        googleSignIn
                            .signOut()
                            .then((value) => {Get.to(LoginScreen())});
                        box.write("logged_in", false);
                      } else {
                        await FirebaseAuth.instance
                            .signOut()
                            .then((value) => {Get.to(LoginScreen())});
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(18),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Sign Out"),
                          Icon(Trend.TrendIcons.forwad_button,
                              color: Color(0xfff79f00), size: 15),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 11.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                              child: Text(
                            "App Version 1.1",
                            style: TextStyle(
                                fontSize: 10, color: Color(0xff707070)),
                          )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class TrendIcons {
}
