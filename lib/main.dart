import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
        
        home: SplashScreen(
            seconds: 2,
            // the widget to run after running your splashscreen for 1 sec
            navigateAfterSeconds: LoginScreen(),
            title: Text(''),
           
            backgroundColor:Color(0xFFe54f4f),
            styleTextUnderTheLoader: TextStyle(),
            photoSize: 100,
            loadingText: Text(
              "Loading...",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
            loaderColor: Colors.white)
            );
  }
}
