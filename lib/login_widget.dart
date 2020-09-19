import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:provider/provider.dart';
import 'package:trendradio/TermsAndConditions.dart';
import 'package:trendradio/TrendHome.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:trendradio/data/streaminfo.dart';

import 'AuthState.dart';



class LoginWidget extends StatefulWidget {
   
  const LoginWidget({
    Key key,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

StreamInfo info = Get.find();
  Future<void> navigate_to_home() async {
     
    if(info.termsAndConditions == false) {
        Get.to( TermsAndConditions());
        return;
    }

    Get.to(TrendHome());

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
                    onPressed: () async{
                        
                         // navigate_to_home();

                        final facebookLogin = FacebookLogin();
                  final result = await facebookLogin.logIn(['email']);

                  switch (result.status) {
                    case FacebookLoginStatus.loggedIn:
                      final token = result.accessToken.token;
                      final graphResponse = await http.get(
                          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,picture.width(800).height(800),email&access_token=${token}');
                      final p = convert.json.decode(graphResponse.body);
                      Map profile = Map<String, dynamic>.from(p);

                      print(profile);
                      //final appState = Provider.of<AuthState>(context, listen: false);
                      // appState.setDisplayName(profile['name']);
                      // appState.setEmailAddress(profile['email']);
                      // appState.setImageUrl(profile['picture']['data']['url']);

                      info.setName(profile['name']);
                      info.setProfilePicUrl(profile['picture']['data']['url']);
                      info.setEmail(profile['email']);

                      
                      navigate_to_home();
                      break;
                    case FacebookLoginStatus.cancelledByUser:
                      print("Canceld");
                      break;
                    case FacebookLoginStatus.error:
                      print(result.errorMessage);
                      break;
                  }
                      
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
