import 'package:Trend/trend_icons_icons.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Settings extends StatelessWidget {
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
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(1000, 70)))),
        Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 30),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.010),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 80),
                                child: IconButton(
                                    icon: Icon(
                                      TrendIcons.cancel_button,
                                      color: Color(0xff707070),
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    }),
                              ),
                              Text("Settings",
                                  style: TextStyle(
                                      color: Color(0xff707070),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                      
                                      )
                                      
                                      ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            Container(
                              height: 70,
                              color: Color(0xfffafafa),
                              child: Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Push Notifications",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    CustomSwitch(
                                        activeColor: Color(0xfff79f00),
                                        onChanged: (changed) {
                                          return true;
                                        },
                                        value: false),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              child: Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Dark Mode",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    CustomSwitch(
                                        activeColor: Color(0xfff79f00),
                                        onChanged: (changed) {
                                          return true;
                                        },
                                        value: false),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              color: Color(0xfffafafa),
                              child: Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Email Newsletter",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    CustomSwitch(
                                        activeColor: Color(0xfff79f00),
                                        onChanged: (changed) {
                                          return true;
                                        },
                                        value: true)
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              child: Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Let us know how we're doing",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Icon(
                                      TrendIcons.forwad_button,
                                      size: 15,
                                      color: Color(0xfff79f00),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 11.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                            child: Text(
                          "App Version 1.1",
                          style:
                              TextStyle(fontSize: 10, color: Color(0xff707070)),
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import 'package:trendradio/data/streaminfo.dart';
// import 'package:trendradio/trend_icons_icons.dart';
// import 'package:get/get.dart';

// //import 'manage_account.dart';

// class Settings extends StatefulWidget {
//   @override
//   _SettingsState createState() => _SettingsState();
// }

// class _SettingsState extends State<Settings> {

//   StreamInfo info = Get.find();

//   @override
//   Widget build(BuildContext context) {

//     // String _text = authState.getDisplayName;
//     // String _email = authState.getEmailAddress;
//     // String _url = authState.getImageUrl;

//     return Scaffold(
//       body: Stack(children: <Widget>[

//             Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 1,
//                           child: Container(
//                 padding: EdgeInsets.only(
//                   top: 61,
//                   bottom: 30
//                   ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text("Settings",
//                         style:
//                             TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 15.0, right: 15.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("High Quality on mobile data"),
//                               CustomSwitch(
//                                   activeColor: Color(0xfff79f00),
//                                   onChanged: (changed) {
//                                     return true;
//                                   },
//                                   value: true),
//                             ],
//                           ),
//                           Padding(
//                             padding:EdgeInsets.only(top :22.0),
//                             child: Divider(color: Color(0xff33393939)),
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Push Notifications"),
//                               CustomSwitch(
//                                   activeColor: Color(0xfff79f00),
//                                   onChanged: (changed) {
//                                     return true;
//                                   },
//                                   value: false),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top: 22.0),
//                             child: Divider(color: Color(0xff33393939)),
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Dark Mode"),
//                               CustomSwitch(
//                                   activeColor: Color(0xfff79f00),
//                                   onChanged: (changed) {
//                                     return true;
//                                   },
//                                   value: false),
//                             ],
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 22.0),
//                             child: Divider(color: Color(0xff33393939)),
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Email Newsletter",
//                                 style: TextStyle(fontSize: 14),
//                               ),
//                               CustomSwitch(
//                                   activeColor: Color(0xfff79f00),
//                                   onChanged: (changed) {
//                                     return true;
//                                   },
//                                   value: true)
//                             ],
//                           ),
//                           Padding(
//                             padding:  EdgeInsets.only(top :22.0),
//                             child: Divider(color: Color(0xff33393939)),
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("Feedback"),
//                              Icon(TrendIcons.forwad_button, size: 15, color: Color(0xfff79f00),)
//                             ],
//                           ),

//                         ],
//                       ),
//                        Container(
//                          width: MediaQuery.of(context).size.width,
//                          color: Colors.white,
//                          child: Padding(
//                            padding: EdgeInsets.only(bottom: 11.0),
//                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.end,
//                              children: [
//                                Center(
//                                    child: Text(
//                                  "App Version 1.1",
//                                  style: TextStyle(fontSize: 10,color: Color(0xff707070)),
//                                )),
//                              ],
//                            ),
//                          ),
//                        )
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       )

//       ]),
//     );
//   }
// }
