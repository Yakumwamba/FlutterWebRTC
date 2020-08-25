import 'package:flutter/material.dart';

import '../trend_icons_icons.dart';

class DjFeatures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.20),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.only(
            
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)
          ),
          image: DecorationImage(
              image: AssetImage(
                'assets/images/dj_features.jpg',
              ),
              fit: BoxFit.fitWidth,
              alignment:
                  Alignment.lerp(Alignment.center, Alignment.topRight, 0.68),
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken)),
        ),
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: Icon(
                  TrendIcons.dj_feature,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 22,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Dj Features",
                      style: TextStyle(fontSize: 30,
                      color: Colors.white
                      ),
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
