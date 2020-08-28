import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendradio/login.dart';


void main() {
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trend Radio',
      
      theme: ThemeData(
           
          primaryColor: Color(0xffF79F00),
          accentColor: Color(0xffffd544),
          fontFamily: 'Sofia_regular',
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      
      home: LoginScreen()
      
      
    );
  }
}
