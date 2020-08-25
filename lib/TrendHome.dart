import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendradio/play_screen.dart';
import 'package:trendradio/trend_icons_icons.dart';
import 'package:trendradio/ui/accounts_view.dart';
import 'package:trendradio/ui/dj_features.dart';
import 'package:trendradio/ui/home_view.dart';
import 'package:trendradio/ui/online_tv.dart';

import 'AuthState.dart';

class TrendHome extends StatefulWidget {
  final Map userprofile;

  TrendHome({Key key, @required this.userprofile}) : super(key: key);

  @override
  _TrendHomeState createState() => _TrendHomeState();
}

class _TrendHomeState extends State<TrendHome> {
  int _currentIndex = 1;

  List<Widget> _children = [
    AccountView(),
    HomeView(),
    HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    


    
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(TrendIcons.trend_user), title: Text("")),
            BottomNavigationBarItem(
                icon: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange[500],
                      borderRadius: BorderRadius.circular(1)),
                ),
                title: Text('play')),
            BottomNavigationBarItem(
                icon: Icon(TrendIcons.trend_settings), title: Text(""))
          ],
          onTap: (int index) {
            final appState = Provider.of<AuthState>(context, listen: false);
                appState.setDisplayName(widget.userprofile['name']);
                appState.setEmailAddress(widget.userprofile['email']);
                appState.setImageUrl(widget.userprofile['picture']['data']['url']);
                print(widget.userprofile['picture']['data']['url']);
                
            if (index == 0) {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                    builder: (BuildContext context) {
                return ChangeNotifierProvider<AuthState>.value(
                  value: appState,
                  child: AccountView(),);
              
              }));
              return;
            }

            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: _children[_currentIndex]);
  }
}
