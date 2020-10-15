import 'package:flutter/material.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:get/get.dart';
import 'package:trendradio/data/controller.dart';

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
  Controller controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();

    //playingStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              flex: 6,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 25.0, right: 25, top: 30, bottom: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage('assets/images/online_tv.jpg'),
                            fit: BoxFit.fill,
                            alignment: Alignment.lerp(
                                Alignment.center, Alignment.topLeft, 0.30),
                            colorFilter: ColorFilter.mode(
                                Colors.grey, BlendMode.darken)),
                      ),
                      child: Center(
                        child: Container(
                          child: Center(
                              child: Icon(
                            TrendIcons.play_button,
                            color: Colors.orange,
                            size: 50,
                          )),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                        ),
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
                            "Hi,",
                            style: TextStyle(
                              
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                
                                color: Colors.white),
                          ),
                          Text("Howard", style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25),
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      alignment: Alignment.lerp(
                                          Alignment.center,
                                          Alignment.topLeft,
                                          0.30),
                                      colorFilter: ColorFilter.mode(
                                          Colors.grey[300], BlendMode.darken),
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/dj_features.jpg')),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              Center(
                                  child: Icon(TrendIcons.dj_feature,
                                      size: 45, color: Colors.white)),
                              Positioned(
                                left: 35,
                                bottom: 10,
                                child: Text(
                                  "Features",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/tv.png'),
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey[300], BlendMode.darken),
                                  ),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              Center(
                                  child: Icon(TrendIcons.online_tv,
                                      size: 40, color: Colors.white)),
                              Positioned(
                                left: 65,
                                bottom: 10,
                                child: Text(
                                  "TV",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        )
      ],
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
