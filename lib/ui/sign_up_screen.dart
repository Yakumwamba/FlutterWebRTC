import 'package:Trend/signupWidget.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import '../email_login_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
// TODO 5: Override the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      // TODO 6: Create a Stack Widget
      body: Stack(
        children: <Widget>[
          // TODO 7: Add a SizedBox to contain our video.

          Center(
            child: Container(
              padding:
                  EdgeInsets.only(bottom: 20, top: 70, left: 30, right: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFFf79f00), Color(0XFFe54f4f)]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [EmailSignUpWidget()],
              ),
            ),
          )
        ],
      ),
    );
  }

  // TODO 8: Override the dipose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
  }
}
