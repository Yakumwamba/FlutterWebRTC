import 'package:Trend/settings.dart';
import 'package:Trend/ui/accounts_view.dart'  hide TrendIcons;
import 'package:Trend/ui/home_view.dart';
import 'package:Trend/ui/transitions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:Trend/trend_icons_icons.dart';
import 'package:rate_my_app/rate_my_app.dart';


class TrendHome extends StatefulWidget {


  @override
  _TrendHomeState createState() => _TrendHomeState();
}

class _TrendHomeState extends State<TrendHome> {
  
RateMyApp rateMyApp = RateMyApp(
  preferencesPrefix: 'rateMyApp_',
  minDays: 0, // Show rate popup on first day of install.
  minLaunches: 2, // Show rate popup after 5 launches of app after minDays is passed.
);


@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await rateMyApp.init();
    if (mounted && rateMyApp.shouldOpenDialog) {  
      rateMyApp.showRateDialog  (context, title: "Rate and Review us" , message: "We would love to read what you think of our app. Please take some time to rate and review it. It really helps us and shouldn’t take more than a minute." );
    }
  });
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
                  child: Padding(
                    padding: const EdgeInsets.only(bottom :4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  
                                   Navigator.of(context).push(Transitions.createRoute(AccountView()));
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
                          width: 45.1,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                   Navigator.of(context).push(Transitions.createRoute(Settings()));
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
                    ),
                  )),
            )
          ],
        ),
        body: HomeView());
  }
}