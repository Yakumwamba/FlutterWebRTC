import 'package:flutter/material.dart';
import 'package:trendradio/trend_icons_icons.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: 
                    BottomNavigationBar(items: [
                    BottomNavigationBarItem(icon: Icon(TrendIcons.trend_user), title:   Text("") ),
                    BottomNavigationBarItem( icon: Icon(TrendIcons.trend_home ), title: Text("") ),
                    BottomNavigationBarItem(icon: Icon(TrendIcons.trend_settings), title: Text("") )
                  ],
                  ),
          body: Container(

            padding: EdgeInsets.all(20),
                child: Column(
             
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    
                  Expanded(
                    flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5, bottom: 5),
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
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [Color(0xFFe54f4f), Color(0XFF661980)]),
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(TrendIcons.listen, 
                                  color: Colors.white,
                                  size: 100,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("LISTEN", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50,
                                    color: Colors.white
                                    ),),
                                )
                              ],
                            )
                            ),
                        ),
                      ),
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
                        child: Text("") 
                        
                        ),
                    ),
                    
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
                        child:Text("sad")
                        
                        ),
                    ),
                    
                    )
                ],)
      ),
    );
  }
}