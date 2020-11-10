import 'package:Trend/data/streaminfo.dart';
import 'package:Trend/login.dart';
import 'package:Trend/radio/flutter_radio_player.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
//import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  //GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    Get.put(StreamInfo());
    Get.put(FlutterRadioPlayer());
    //Get.put(VideoPlayerController());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trend Radio',
        theme: ThemeData(
          primaryColor: Color(0xffF79F00),
          accentColor: Color(0xffffd544),
          fontFamily: 'Sofia_regular',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Center(
          child: Builder(builder: (BuildContext context) {
            return AnimatedSplashScreen(
                duration: 3000,
                splash: SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      height: Get.height,
                      child: Lottie.asset(
                        'assets/json/Trend-Splash-Animation.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                nextScreen:
                    LoginScreen(),
                splashIconSize: Get.height,
                splashTransition: SplashTransition.fadeTransition,
                backgroundColor: Colors.white);
          }),
        ));
  }
}
