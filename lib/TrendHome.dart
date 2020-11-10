import 'package:Trend/settings.dart';

import 'package:Trend/ui/accounts_view.dart'  hide TrendIcons;
import 'package:Trend/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'package:Trend/trend_icons_icons.dart';


class TrendHome extends StatefulWidget {


  @override
  _TrendHomeState createState() => _TrendHomeState();
}

class _TrendHomeState extends State<TrendHome> {
  


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

    return Scaffold(
        bottomNavigationBar: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                  height: 72,
                  width: Get.width,
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                   boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.30),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                
                                 Navigator.of(context).push(_createRoute(AccountView()));
                              },
                              icon: Icon(
                                TrendIcons.trend_user,
                                color: Color(0xff707070),
                                size: 32,
                              )),
                              Text("Profile")
                        ],
                      ),
                      SizedBox(
                        width: 66.1,
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                               Navigator.of(context).push(_createRoute(Settings()));
                              //Get.to( Settings());
                            },
                            icon: Icon(
                              TrendIcons.trend_settings,
                              color: Color(0xff707070),
                              size: 32,
                            ),
                          ),
                          Text("Settings")
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
        body: HomeView());
  }
}