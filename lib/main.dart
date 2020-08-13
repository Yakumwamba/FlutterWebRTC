import 'package:flutter/material.dart';
import 'package:trendradio/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
          primaryColor: Color(0xffF79F00),
          accentColor: Color(0xffffd544),
          fontFamily: 'Sofia',
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:LoginScreen(),
    );
  }
}
