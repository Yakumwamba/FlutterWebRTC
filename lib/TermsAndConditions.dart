import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:trendradio/TrendHome.dart';
import 'package:trendradio/trend_icons_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'data/streaminfo.dart';

class TermsAndConditions extends StatefulWidget {
  TermsAndConditions({Key key}) : super(key: key);

  @override
  _TermsAndConditions createState() => _TermsAndConditions();
}

class _TermsAndConditions extends State<TermsAndConditions> {
  int _currentIndex = 0;
  StreamInfo info = Get.find();
  GetStorage box = GetStorage();
  final _key = UniqueKey();
  @override
  void initState() {
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _bottom_buttons(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Color(0xffFAFAFA)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlineButton(
                onPressed: () {
                  Get.back();
                },
                textColor: Theme.of(context).primaryColor,
                highlightedBorderColor: Colors.orange,
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text("No"),
              ),
            ),
          ),
          Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  Get.to(TrendHome());
                  info.setTermsAndConditionsTrue(true);
                  box.write("ts_agreed", "true");
                },
                child: Text("Yes"),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(child: Text("sad"),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.20),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Text(
                                      "Terms & Conditions",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                        dragStartBehavior: DragStartBehavior.start,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            height: 100,
                            child: Text("as")
                            //WebView(initialUrl: "https//www.Google.com"),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                    child: Container(
                      child: Center(
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Checkbox(
                                    value: false,
                                    onChanged: null,
                                    checkColor: Theme.of(context).primaryColor,
                                    visualDensity: VisualDensity.compact,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap),
                                Text("Tap to confirm",
                                    style: TextStyle(fontSize: 9))
                              ],
                            ),
                            Expanded(
                                child: Text(
                              "I have read and understood the terms and conditions",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ))
                          ],
                        )),
                      ),
                    ),
                  ),
                  _bottom_buttons(context),
                ],
              )),
        ),
      ),
    );
  }
}
