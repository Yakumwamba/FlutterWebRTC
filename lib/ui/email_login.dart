import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:video_player/video_player.dart';

import '../email_login_widget.dart';

class EmailLoginScreen extends StatefulWidget {
  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
// TODO 5: Override the initState() method and setup your VideoPlayerController

  GetStorage box = GetStorage();
  @override
  void initState() {
    super.initState();
    if (box.read("logged_in") == 'true') {
      // Get.to(TrendHome());
    }
    // Pointing the video controller to our local asset.
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      // TODO 6: Create a Stack Widget
      body: Stack(
        children: [
          Container(
              height: Get.width * 1.1,
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
                      bottom: Radius.elliptical(Get.width * 3, 90)))),
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.010),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(

                    child: EmailLoginWidget()
                    ),
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
