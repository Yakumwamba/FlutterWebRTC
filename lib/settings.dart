import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:trendradio/trend_icons_icons.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
  
            Container(
              padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
                          child: Container(
                padding: EdgeInsets.only(
                  top: 61, 
                  bottom: 30
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Settings",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("High Quality on mobile data"),
                              CustomSwitch(
                                  activeColor: Color(0xfff79f00),
                                  onChanged: (changed) {
                                    return true;
                                  },
                                  value: true),
                            ],
                          ),
                          Padding(
                            padding:EdgeInsets.only(top :22.0),
                            child: Divider(color: Color(0xff33393939)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Push Notifications"),
                              CustomSwitch(
                                  activeColor: Color(0xfff79f00),
                                  onChanged: (changed) {
                                    return true;
                                  },
                                  value: false),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 22.0),
                            child: Divider(color: Color(0xff33393939)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Dark Mode"),
                              CustomSwitch(
                                  activeColor: Color(0xfff79f00),
                                  onChanged: (changed) {
                                    return true;
                                  },
                                  value: false),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0),
                            child: Divider(color: Color(0xff33393939)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Padding(
                            padding:  EdgeInsets.only(top :22.0),
                            child: Divider(color: Color(0xff33393939)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Feedback"),
                             Icon(TrendIcons.forwad_button, size: 15, color: Color(0xfff79f00),)
                            ],
                          ),
                       
                        ],
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
                                 style: TextStyle(fontSize: 10,color: Color(0xff707070)),
                               )),
                             ],
                           ),
                         ),
                       )
                    ],
                  ),
                ),
              ),
            )
          ],
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
