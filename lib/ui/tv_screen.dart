import 'package:Trend/trend_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Tv_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
          height: Get.width * 0.80,
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
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(1000, 70))),
                  
                child: Column(
       
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Icon(
                    TrendIcons.online_tv,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 8, bottom: 30, top: 10),
                child: Center(
                  child: Text(
                  "Stay tuned",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  fontSize: 20
                  ),
                )),
              )
            ],
          ),  
      )]
        )
    );
  }
}
