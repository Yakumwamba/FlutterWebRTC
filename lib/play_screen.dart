import 'package:flutter/material.dart';
import 'package:trendradio/trend_icons_icons.dart';

class PlayScreen extends StatefulWidget {
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
          child: Container(
         child: Container(
           decoration: BoxDecoration(color: Colors.red,
           gradient: LinearGradient(begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [Color(0xFFe54f4f), Color(0XFF661980)]), ),
           
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.only(top: 40, bottom: 5, right: 15),
                 child: Icon(TrendIcons.arrow_down, color: Colors.white, size: 16,),
               ),
               Padding(
                 padding: const EdgeInsets.all(13.0),
                 child: Container(
                   padding: EdgeInsets.only(left: 10, right: 10),
                        height:  MediaQuery.of(context).size.width * 0.9,
                        width:  MediaQuery.of(context).size.width ,
                        decoration: BoxDecoration(
                                 boxShadow:  [
                                   
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.010),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), 
                                 )],
                                 
                                 color: Color(0xfff79f00),
                                 borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)
      ),
                                ),
                                child:  Flexible(
                                  child: Center(
                                        child: Image.asset('assets/logo/logo_white.png', 
                                        fit: BoxFit.contain,
                                        width: 200,
                                        height: 200,
                    )
                    
                    ),
                ),
                                
                                 
                                
                                
                                
                        ),
               ),
               Container(
                 padding: EdgeInsets.all(10),
                 width: MediaQuery.of(context).size.width,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget> [
                     Text("Love Recipe", style: TextStyle(
                       color: Colors.white, 
                       fontSize: 30, 
                       fontFamily: 'Sofia_regular'
                       
                       
                       ),
                       
                       ),
                       SizedBox(height: 2,),
                      Text("Mampi - The Queen Diva", style: TextStyle(
                       color: Colors.white, 
                       fontSize: 12, 
                       fontFamily: 'Sofia_regular')
                       
                       
                       ),
                        SizedBox(height: 10,),
                       Container(
                         
                         width: 350,
                         height: 5,
                         decoration: BoxDecoration(
                           color: Color(0xffffffff),
                           borderRadius: BorderRadius.circular(5)),
                       
                       )
                       
                      

                   ],
                   
                   ),
               )      
               ],
           ),
           ),
      ),
    );
  }
}