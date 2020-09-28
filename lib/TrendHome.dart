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
        bottomNavigationBar:  BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(TrendIcons.trend_user), title: Text("")),
            BottomNavigationBarItem(
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.orange[500],
                      
                      borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(TrendIcons.play_button,  size: 50,  color: Color(0xff37003c),),
                        ],
                      ),
                ),
                title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(TrendIcons.trend_settings), title: Text(""))
          ],
          onTap: (int index) {
            // final appState = Provider.of<AuthState>(context, listen: false);
            //     appState.setDisplayName(widget.userprofile['name']);
            //     appState.setEmailAddress(widget.userprofile['email']);
            //     appState.setImageUrl(widget.userprofile['picture']['data']['url']);
            //     print(widget.userprofile['picture']['data']['url']);
                
            if (index == 0) {
              Get.to( AccountView());
              return;
            }
            if ( index == 2) {
                 Get.to( Settings());
                 return;
            }
            // if(index == 2 ){
            //   Navigator.of(context)
            //       .push(MaterialPageRoute(
            //         builder: (BuildContext context) {
            //     return Settings();
              
            //   }));
            //   return;
            // }

            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: _children[_currentIndex]);
  }
}
