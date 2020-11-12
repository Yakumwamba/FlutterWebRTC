
import 'package:Trend/trend_icons_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  //final Controller controller = Get.put(Controller());

  final GetStorage box = GetStorage();
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'example@example.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController();
  bool submited = false;
  RegExp exp =
      new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final databaseReference = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    // send();
  }

  Future<void> sendFeedback({String userId, String feedback}) async {
    setState(() {
      submited = true;
    });
    await databaseReference
        .collection("feedback")
        .doc(userId)
        .set({'feedback': feedback, 'user': userId}).then((_) {

      setState(() {
        submited = false;
        _bodyController.clear();
      });

       _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Thank's ${box.read("firstname")} for your feedback!",
        style: TextStyle(color: Colors.orange[400], fontSize: 14),
      ),
      backgroundColor: Colors.grey[100],
    ));
    });
  }

  Future<void> send() async {
    final Email email = Email(
      body: validateFeedback(text: _bodyController.text),
      subject: "Feedback from ${box.read('firstname')}",
      recipients: ["trend@trendonlineradio.com"],
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email).then((value) {
        setState(() {
          submited = false;
        });
      });
      platformResponse = 'Thanks, will get back to you soon...';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        platformResponse,
        style: TextStyle(color: Colors.orange[400], fontSize: 14),
      ),
      backgroundColor: Colors.grey[100],
    ));

    print(platformResponse);
  }

//close button

  GestureDetector _submitButton() {
    bool activeButton = !submited && _bodyController.text != "";

    return GestureDetector(
      onTap: () {
        if (!submited && _bodyController.text != "") {
          sendFeedback(
              userId: box.read("userId"), feedback: _bodyController.text);
        }
      },
      child: Container(
        height: 46,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.010),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
            color: activeButton ? Color(0xfff79f00) : Color(0xffc1c1c1)),
        child: Center(
            child: Text(
          "Submit",
          style: TextStyle(
              color: Color(0xff262626),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
//print(text.replaceAll(exp, "---"));

  String validateFeedback({String text}) {
    return text.replaceAll(exp, '[Redacted]');
  }

  Widget _buildTextField() {
    final maxLines = 25;

    return !submited
        ? Container(
            margin: EdgeInsets.only(bottom: 10),
            height: maxLines * 24.0,
            width: Get.width,
            child: TextField(
              cursorColor: Colors.orange,
              maxLines: maxLines,
              decoration: InputDecoration(
                  hintText: "Let us know how we're doing...",
                  fillColor: Colors.grey[100],
                  filled: true,
                  hoverColor: Colors.grey),
              controller: _bodyController,
            ),
          )
        : SpinKitFadingCircle(itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.orange : Colors.yellow,
              ),
            );
          });
  }

  @override
  Widget build(BuildContext context) {
    Iterable<RegExpMatch> matches = exp.allMatches("asd");
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
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
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 40),
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
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 60),
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
                                            Text("Feedback",
                                                style: TextStyle(
                                                    color: Color(0xff707070),
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: _buildTextField()),
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
                                      Center(child: _submitButton()),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
