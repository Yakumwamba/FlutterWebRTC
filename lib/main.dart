import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
//import 'package:get_storage/get_storage.dart';

import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:trendradio/TrendHome.dart';
import 'package:trendradio/data/streaminfo.dart';
import 'package:trendradio/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //GetStorage.init();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Get.put(StreamInfo());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trend Radio',
        theme: ThemeData(
          primaryColor: Color(0xffF79F00),
          accentColor: Color(0xffffd544),
          fontFamily: 'Sofia_regular',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Builder(builder: (BuildContext context) {
          return AnimatedSplashScreen(
              duration: 3000,
              splash: Lottie.asset('assets/json/Trend-Splash-Animation.json',
                  fit: BoxFit.contain, width: Get.width, height: Get.height),
              centered: true,
              nextScreen: LoginScreen(),
              splashIconSize: MediaQuery.of(context).size.height,
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: Colors.white);
        }));
  }
}
