import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:trendradio/TermsAndConditions.dart';
import 'package:trendradio/TrendHome.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:trendradio/data/streaminfo.dart';

import 'AuthState.dart';
import 'custom_web_view.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key key,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  //GetStorage box = GetStorage();

  String your_client_id = "381667702819164";
  String redirect_url = "https://www.facebook.com/connect/login_success.html";

  StreamInfo info = Get.find();
  final auth = FirebaseAuth.instance;

  GetStorage box = GetStorage();
  Future<void> navigate_to_home() async {
    // if (box.read("ts_agreed")) {
    //   // Get.to(transition: PageTransition(
    //   // type: PageTransitionType.fade,
    //   // child:));c
    //   // return;
    //   Get.to(  TrendHome());
    //   //Navigator.push(context, PageTransition(type: PageTransitionType.downToUp, child:TermsAndConditions()));
    //   return;
    // }
    if (box.read("ts_agreed") == "true") {
      print(box.read("ts_agreed"));
      Get.to(TrendHome());
      return;
    }
    print(box.read("ts_agreed"));
    Get.to(TermsAndConditions());
  }


// @override
// void initState() { 
//   super.initState();
//   if(  box.read("logged_in") == "true") {
//    // info.getTrackInfo();
//     Get.to(TermsAndConditions());
//   }
//      info.getTrackInfo();
// }

  loginWithFacebook() async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CustomWebView(
                selectedUrl:
                    'https://www.facebook.com/dialog/oauth?client_id=$your_client_id&redirect_uri=$redirect_url&response_type=token&scope=email,public_profile',
              ),
          maintainState: true),
    );

    if (result != null) {
      try {
        final facebookAuthCred =
            FacebookAuthProvider.getCredential(accessToken: result);
        final user = await auth.signInWithCredential(facebookAuthCred);
        print("Hooray gone in");
        box.write("username", user.user.displayName);
        box.write("email", user.user.email);
        box.write("photoUrl", user.user.photoUrl);
        box.write("logged_in", "true");
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,picture,last_name,email&access_token=$result');
        var profile = json.decode(graphResponse.body);
        box.write("photoUrl", profile['picture']['data']['url']);

        print(profile['picture']['data']['url']);
        user.user.printInfo();
        // print(user.user.providerData);

        navigate_to_home();
      } catch (e) {
        print("bad happend");
        print(e);
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 50,
                child: FacebookSignInButton(
                    onPressed: () async {
                      //navigate_to_home();
                      if(box.read("logged_in") == "true"){
                        navigate_to_home();
                        return;
                      }
                      //navigate_to_home();
                      loginWithFacebook();
                      //debugPrint("Clicked on it just now");
                    },
                    borderRadius: 8.0,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.white)),
              ),
              SizedBox(height: 10),
              Container(
                  height: 50,
                  child: GoogleSignInButton(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20),
                      onPressed: () {},
                      borderRadius: 8.0)),
              SizedBox(height: 30),
              Center(
                child: Container(
                  width: 150,
                  child: Column(
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
                      Opacity(
                        opacity: 0.6,
                        child: Text(
                          "Terms and Conditions",
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
    );
  }
}
