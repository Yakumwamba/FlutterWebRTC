
import 'package:flutter/material.dart';
import 'package:trendradio/trend_icons_icons.dart';


class TrendHome extends StatefulWidget {
  TrendHome({Key key}) : super(key: key);

  @override
  _TrendHomeState createState() => _TrendHomeState();
}

class _TrendHomeState extends State<TrendHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            bottomNavigationBar: BottomNavigationBar(items: [
                    BottomNavigationBarItem(icon: Icon(TrendIcons.trend_user), title:   Text("") ),
                    BottomNavigationBarItem( icon: Icon(TrendIcons.trend_home ), title: Text("") ),
        BottomNavigationBarItem(icon: Icon(TrendIcons.trend_settings),title: Text("") )
                  ],
              
              
                  ),
          body: Container(

            padding: EdgeInsets.all(20),
                child: Column(
             
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 10),
                      child: Text("Good Afternoon, Caroline", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                    ),
                  Expanded(
                    flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                           boxShadow:  [
                             
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.20),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), 
                           )],
                            gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topCenter,
                                  colors: [Colors.lightBlueAccent[100], Colors.purple]),
                           color: Colors.white,
                           borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)
    ),
                          ),
                          child: Center(
                            
                            child: Column(
                              children: <Widget>[
                                Image.asset(""),
                              ],
                            )
                            ),
                        ),
                      ),
                    ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                           boxShadow:  [
                             
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.20),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), 
                           )],

                           color: Colors.white,
                           borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)
                                        ),
                          ),
                        child: Container(
                          
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(""),
                                ),
                              ],
                            ),
                          ),
                        )),
                    )
                      
                ),

                  Expanded(
                    flex:1,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                         decoration: BoxDecoration(
                           boxShadow:  [
                             
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.20),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), 
                           )],

                           color: Colors.white,
                           borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)
    ),
                          ),
                        child: Center(child: Text(""))),
                    ),)
                ],)
      ),
    );
  }
}