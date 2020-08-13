import 'package:flutter/material.dart';

import '../trend_icons_icons.dart';

class OnlineTv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                          
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(TrendIcons.online_tv, size: 48,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text("Online TV", style: TextStyle(fontSize: 25),),
                                      ),
                                       Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text("Coming soon", style: TextStyle(fontSize: 10),),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
  }
}