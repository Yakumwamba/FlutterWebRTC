// import 'dart:convert';

// import 'package:Trend/trend_icons_icons.dart';
// import 'package:Trend/ui/email_login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

// import 'package:get/get.dart';

// import 'package:get/state_manager.dart';
// import 'package:get_storage/get_storage.dart';
// //import 'package:get_storage/get_storage.dart';




// class LoginWidget extends StatelessWidget {


//   String your_client_id = "381667702819164";
//   String redirect_url = "https://www.facebook.com/connect/login_success.html";
 
//   GetStorage box = GetStorage();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           alignment: Alignment.center,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               InkWell(
//                 onTap: () {
//                   if (box.read("logged_in") == 'true') {
//                     //Get.to(TrendHome());
//                   }
//                   Get.to(EmailLoginScreen());
//                 },
//                 child: Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(6))),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(left: 14, right: 30),
//                         child: Icon(
//                           TrendIcons.email_icon,
//                           size: 15,
//                           color: Colors.orange,
//                         ),
//                       ),
//                       Text(
//                         "Continue with Email",
//                         style: TextStyle(fontSize: 20),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 height: 50,
//                 child: FacebookSignInButton(
//                     onPressed: () async {
//                       //navigate_to_home();
//                       if (box.read("logged_in") == "true") {
//                         //navigate_to_home();
//                         return;
//                       }
//                       //navigate_to_home();
//                       //loginWithFacebook();
//                       //debugPrint("Clicked on it just now");
//                     },
//                     borderRadius: 8.0,
//                     textStyle: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         fontSize: 20,
//                         color: Colors.white)),
//               ),
//               SizedBox(height: 10),
//               Container(
//                   height: 50,
//                   child: GoogleSignInButton(
//                       textStyle: TextStyle(
//                           fontWeight: FontWeight.normal, fontSize: 20),
//                       onPressed: () {},
//                       borderRadius: 8.0)),
//               SizedBox(height: 30),
//               Center(
//                 child: Container(
//                   width: 150,
//                   child: Column(
//                     children: [
//                       Opacity(
//                         opacity: 0.4,
//                         child: Text(
//                           "By continuing you agree with our",
//                           style: TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.normal,
//                               color: Colors.white),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       Opacity(
//                         opacity: 0.6,
//                         child: Text(
//                           "Terms and Conditions",
//                           style: TextStyle(
//                               fontSize: 10,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }