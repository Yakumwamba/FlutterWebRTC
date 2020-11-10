import 'package:Trend/data/controller.dart';
import 'package:Trend/ui/dj_screen.dart';
import 'package:Trend/ui/tv_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../play_screen.dart';
import '../trend_icons_icons.dart';
import 'dj_features.dart';
import 'online_tv.dart';
import 'dart:math';

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Controller controller = Get.put(Controller());

  final GetStorage box = GetStorage();

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
    var username = box.read("firstname");

    return WillPopScope(
      onWillPop: () async {
        if (box.read("logged_in") == true) {
          return false;
        }
        return false;
      },
      child: Stack(
        children: [
          Container(
              height: Get.width * 0.80,
              decoration: BoxDecoration(
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
                      colors: [Color(0xFFf79f00), Color(0XFFe54f4f)]),
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(Get.width * 3, 90)))),
          Column(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20, top: 40, bottom: 10),
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/online_tv.jpg'),
                                fit: BoxFit.fill,
                                alignment: Alignment.lerp(
                                    Alignment.center, Alignment.topLeft, 0.30),
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.darken)),
                          ),
                          child: InkWell(
                            splashColor: Colors.orange,
                            onTap: () {
                              Navigator.of(context)
                                  .push(_createRoute(PlayScreen()));
                              //Get.to(PlayScreen());
                            },
                            child: Center(
                              child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: 10, right: 20.0),
                                    child: Center(
                                      child: Icon(
                                        TrendIcons.play_button,
                                        color: Colors.orange,
                                        size: 68,
                                      ),
                                    ),
                                  ),
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white)),
                            ),
                          )),
                      Positioned(
                        left: 10,
                        bottom: 45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi,",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             "${box.read('firstname')}",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20),
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: InkWell(
                              splashColor: Colors.orange,
                              onTap: () {
                                Navigator.of(context)
                                    .push(_createRoute(Dj_Screen()));
                                // Get.to(Dj_Screen());
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          alignment: Alignment.lerp(
                                              Alignment.center,
                                              Alignment.bottomCenter,
                                              0.50),
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.3),
                                              BlendMode.darken),
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/dj_features.jpg')),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 2),
                                          Icon(TrendIcons.dj_feature,
                                              size: 50, color: Colors.white),
                                              Padding(
                                                padding: const EdgeInsets.only(right: 2.0),
                                                child: Text(
                                      "Features",
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                              ),
                                        ],
                                      )),
                                
                                ],
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Ink(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(_createRoute(Tv_Screen()));
                                  //Get.to(Tv_Screen());
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/tv.png'),
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.3),
                                              BlendMode.darken),
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(height: 2),
                                            Icon(TrendIcons.online_tv,
                                                size: 42, color: Colors.white),
                                                Padding(
                                                  padding:  EdgeInsets.only(left: 3.0),
                                                  child: Text(
                                        "TV",
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white),
                                      ),
                                                ),
                                          ],
                                        )),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

// class CurvedShape extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: Get.height,
//       child: CustomPaint(
//         painter: _MyPainter(),
//       ),
//     );
//   }
// }

// class _MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = new Paint()
//       ..style = PaintingStyle.fill
//       ..isAntiAlias = true
//       ..color = Colors.purple[700];

//     Offset circleCenter = Offset(size.width / 2, size.height - AVATAR_RADIUS);

//     Offset topLeft = Offset(0, 0);
//     Offset bottomLeft = Offset(0, size.height * 0.30);
//     Offset topRight = Offset(size.width, 0);
//     Offset bottomRight = Offset(size.width, size.height * 0.5);

//     Offset leftCurveControlPoint = Offset(0.6, 0.9);
//     Offset rightCurveControlPoint = Offset(1.8, 1.2);
//     ;

//     final arcStartAngle = 200 / 180 * pi;
//     final avatarLeftPointX =
//         circleCenter.dx + AVATAR_RADIUS * cos(arcStartAngle);
//     final avatarLeftPointY =
//         circleCenter.dy + AVATAR_RADIUS * sin(arcStartAngle);
//     // the right pont of the arc

//     Path path = Path()
//       ..moveTo(topLeft.dx,
//           topLeft.dy) // this move isn't required since the start point is (0,0)
//       ..lineTo(bottomLeft.dx, bottomLeft.dy)
//       ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy,
//           bottomLeft.dx, bottomRight.dy)
//       ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy,
//           bottomRight.dx, bottomRight.dy)
//       ..lineTo(topRight.dx, topRight.dy)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }

// Container(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Expanded(
//                 flex: 5,
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       top: 10.0, left: 5, right: 5, bottom: 5),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (BuildContext context) {
//                         return PlayScreen();
//                       }));
//                     },
//                     child: Container(
// decoration: BoxDecoration(
//   boxShadow: [
//     BoxShadow(
//       color: Colors.grey.withOpacity(0.20),
//       spreadRadius: 5,
//       blurRadius: 7,
//       offset: Offset(0, 3),
//     )
//   ],
//   gradient: LinearGradient(
//       begin: Alignment.bottomCenter,
//       end: Alignment.topCenter,
//       colors: [Color(0xFFe54f4f), Color(0XFF661980)]),
//   color: Colors.white,
//   borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(15),
//       topRight: Radius.circular(15),
//       bottomLeft: Radius.circular(15),
//       bottomRight: Radius.circular(15)),
// ),
//                       child: Center(
//                           child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Padding(
//                             padding:  EdgeInsets.all(8.0),
//                             child: Icon(
//                               TrendIcons.listen,
//                               color: Colors.white,
//                               size: 100,
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(
//                               "LISTEN",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 50,
//                                   color: Colors.white),
//                             ),
//                           )
//                         ],
//                       )),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Container(
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.20),
//                                 spreadRadius: 5,
//                                 blurRadius: 7,
//                                 offset: Offset(0, 3),
//                               )
//                             ],
//                             color: Colors.white,
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15),
//                                 topRight: Radius.circular(15),
//                                 bottomLeft: Radius.circular(15),
//                                 bottomRight: Radius.circular(15)),
//                           ),
//                           child: DjFeatures()),
//                     ),
//                      Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Container(
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.20),
//                         spreadRadius: 5,
//                         blurRadius: 7,
//                         offset: Offset(0, 3),
//                       )
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(15),
//                         topRight: Radius.circular(15),
//                         bottomLeft: Radius.circular(15),
//                         bottomRight: Radius.circular(15)),
//                   ),
//                   child: OnlineTv()),
//                 ),
//                   ],
//                 ),
//               ),

//             ],
//           ));
