import 'package:Trend/TrendHome.dart';
import 'package:Trend/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:get_storage/get_storage.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'data/streaminfo.dart';

class AgreedConditions extends StatefulWidget {
  AgreedConditions({Key key}) : super(key: key);

  @override
  _AgreedConditions createState() => _AgreedConditions();
}

class _AgreedConditions extends State<AgreedConditions> {
  GetStorage box = GetStorage();
  String termsOfUse;

  double _height = 1;
  final _key = UniqueKey();

  @override
  void initState() {
    //termsOfUse = await rootBundle.loadString('assets/terms/termsofuse.txt');
    super.initState();
    // loadAsset();
    termsOfUse = "Loading";
    loadAsset().then((value) {
      setState(() {
        termsOfUse = value.toString();
      });
    });

    Get.log("Value of ts ${box.read("ts_agreed")}");
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/terms/termsofuse.txt');
  }

  Container _closeButton({Color color, String label}) {
    return Container(
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
          color: color),
      child: Center(
          child: Text(
        label,
        style: TextStyle(
            color: Color(0xff262626),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      )),
    );
  }

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
                      Colors.pink[50],
                      Colors.pink[50],
                    ]),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(1000, 70)))),
        Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 35),
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
            child: Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 40,
                    child: Container(
                      child: Center(
                        child: Text(
                          "Terms of Use",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff262626),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: termsOfUse == "Loading"
                          ? Center(
                              child: SpinKitFadingCircle(itemBuilder:
                                  (BuildContext context, int index) {
                                return DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: index.isEven
                                        ? Colors.orange
                                        : Colors.yellow,
                                  ),
                                );
                              }),
                            )
                          : SingleChildScrollView(
                              child: SizedBox(
                                height: Get.height * 12,
                                child: Text(
                                  termsOfUse,
                                  textAlign: TextAlign.justify,
                                ),

                                // child: WebViewPlus(
                                //   onWebViewCreated: (controller) {
                                //     this._controller = controller;

                                //     controller.loadUrl(
                                //         'https://www.trendonlineradio.com/privacy-policy');
                                //   },
                                //   onPageFinished: (url) {
                                //     this
                                //         ._controller
                                //         .getHeight()
                                //         .then((double height) {
                                //       print("Height:  " + height.toString());
                                //       setState(() {
                                //         _height = height;
                                //       });
                                //     });
                                //     this._controller.scrollTo(0, 400);
                                //   },
                                //   javascriptMode: JavascriptMode.unrestricted,
                                // ),
                              ),
                            ),
                    ),
                  ),

                  // singleton implementation
                  // for the custom cache manager
                  // factory MyCacheManager() {
                  //   if (_instance == null) {
                  //     _instance = new MyCacheManager._();
                  //   }
                  //   return _instance;
                  // }

                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Center(
                                  child: Container(
                                    height: 46,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.grey.withOpacity(0.010),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                        color: Color(0xfff79f00)),
                                    child: Center(
                                        child: Text(
                                      "Close",
                                      style: TextStyle(
                                          color: Color(0xff262626),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          )
                          // child : InkWell(
                          //     onTap: () {
                          //       Get.back();
                          //     },
                          //     child: Center(child: _bottom_buttons(context)),
                          //   ),
                          ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
