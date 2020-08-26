import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendradio/trend_icons_icons.dart';

import '../AuthState.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);

    // String _text = authState.getDisplayName;
    // String _email = authState.getEmailAddress;
    // String _url = authState.getImageUrl;

    return Scaffold(
      body: Stack(children: <Widget>[
        Consumer<AuthState>(builder: (context, authState, child) {
          return Container(
            padding: EdgeInsets.only(top: 45),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Stack(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.010),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Account",
                            style: TextStyle(
                                fontFamily: 'Sofia_bold',
                                fontSize: 20,
                                color: Color(0xff707070)),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                authState.getImageUrl,
                                fit: BoxFit.cover,
                                height: 72,
                                width: 72,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress
                                                  .expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Text(
                            authState.getDisplayName != null
                                ? authState.getDisplayName
                                : "not set",
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff707070)),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            authState.getEmailAddress != null
                                ? authState.getEmailAddress
                                : "not set",
                            style: TextStyle(
                                fontSize: 12, color: Color(0xff707070)),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: -160,
                        bottom: 0,
                        left: -250,
                        right: 50,
                        child: IconButton(
                          color: Color(0xff707070),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            TrendIcons.cancel_button,
                            size: 20,
                          ),
                        )),
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 43, right: 47),
                    color: Color(0xFFfafafa),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          TrendIcons.group_42,
                          size: 32,
                          color: Color(0xfff79f00),
                        ),
                        Text(
                          "Manage Account",
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.left,
                        ),
                        Icon(TrendIcons.forwad_button,
                            size: 15, color: Color(0xfff79f00))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 43, right: 47),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          TrendIcons.path_42,
                          size: 32,
                          color: Color(0xfff79f00),
                        ),
                        Text(
                          "Get in touch",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Icon(TrendIcons.forwad_button,
                            color: Color(0xfff79f00), size: 15)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 43, right: 47),
                    color: Color(0xFFfafafa),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(TrendIcons.trend_get_in_touch,
                            size: 32, color: Color(0xfff79f00)),
                        Text("Terms & Conditions"),
                        Icon(TrendIcons.forwad_button,
                            color: Color(0xfff79f00), size: 15)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 43, right: 47),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(TrendIcons.trend_logout,
                            size: 32, color: Color(0xfff79f00)),
                        Text("Sign Out"),
                        Icon(TrendIcons.forwad_button,
                            color: Color(0xfff79f00), size: 15),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
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
                  ),
                )
              ],
            ),
          );
        }),
      ]),
    );
  }
}
