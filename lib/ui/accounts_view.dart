import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        Consumer<AuthState>(
            builder: (context, authState, child) {

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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Account",
                            style: TextStyle(
                                fontFamily: 'Sofia_bold',
                                fontSize: 20,
                                color: Color(0xff707070)),
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
                                      value: loadingProgress.expectedTotalBytes !=
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
                          Text(authState.getDisplayName != null ? authState.getDisplayName : "not set"),
                          Text(authState.getEmailAddress != null ? authState.getEmailAddress : "not set")
                        ],
                      ),
                    ),
                    Positioned(
                        top: -160,
                        bottom: 0,
                        left: -250,
                        right: 50,
                        child: Icon(Icons.cancel)),
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFfafafa),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFfafafa),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
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
