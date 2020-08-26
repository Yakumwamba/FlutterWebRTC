import 'package:flutter/material.dart';

import '../trend_icons_icons.dart';

class OnlineTv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                          
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Row(
                              
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                             
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 26),
                                  child: Icon(TrendIcons.online_tv, size: 25,),
                                ),
                                SizedBox(width: 60,),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      
                                      Text("Online TV", style: TextStyle(fontSize: 25),),
                                      Text("Coming soon", style: TextStyle(fontSize: 10),),
                                    ],
                                  ),
                                ),
                        
                              ],
                            ),
                          ),
                        );
  }
}