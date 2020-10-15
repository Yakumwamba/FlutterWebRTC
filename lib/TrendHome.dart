import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:trendradio/data/streaminfo.dart';
import 'package:trendradio/play_screen.dart';
import 'package:trendradio/settings.dart';
import 'package:trendradio/trend_icons_icons.dart';
import 'package:trendradio/ui/accounts_view.dart';
import 'package:trendradio/ui/dj_features.dart';
import 'package:trendradio/ui/home_view.dart';
import 'package:trendradio/ui/online_tv.dart';

import 'AuthState.dart';
import 'data/controller.dart';

class TrendHome extends StatefulWidget {
  TrendHome({Key key}) : super(key: key);

  @override
  _TrendHomeState createState() => _TrendHomeState();
}

class _TrendHomeState extends State<TrendHome> {
  //Controller controller = Controller();s
  StreamInfo controller = Get.put(StreamInfo(), permanent: true);

  int _currentIndex = 1;

  List<Widget> _children = [
    AccountView(),
    HomeView(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                  height: 72,
                  width: Get.width,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                 Get.to(AccountView());
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
                              Get.to( Settings());
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
