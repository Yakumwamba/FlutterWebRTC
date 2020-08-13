import 'package:flutter/material.dart';

import '../trend_icons_icons.dart';

class DjFeatures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
   
    return Stack(
                children: <Widget> [
                  
                  Container(
                        
                     decoration: BoxDecoration(
                          
                        color: Colors.grey,
                          boxShadow:  [
                                
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.20),
                               spreadRadius: 5,
                               blurRadius: 7,
                               offset: Offset(0, 3), 
                          )],


                          borderRadius: BorderRadius.only(
                                     topLeft: Radius.circular(15),
                                     topRight: Radius.circular(15),
                                     bottomLeft: Radius.circular(15),
                                     bottomRight: Radius.circular(15)
                                       ),
                          
                          image: DecorationImage(
                         image: AssetImage(
                             'assets/images/dj_features.jpg',
                             ),
                        fit: BoxFit.fitWidth,
                     alignment: Alignment.lerp(Alignment.center, Alignment.topRight, 0.68),
                     
                     colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken)
                     ), 
                             
                      
                         ),
                     
             ),
             Positioned(
               top: 10,
               bottom:10 ,
               left: 20,
               
               child: Icon(
     
               TrendIcons.dj_feature, 
               color: Colors.white, 
               size: 50,
               )
               
               ),
                Positioned(

                  left: 75,
                  bottom: 30,
                  
                                      child:  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text("Dj Features", style: TextStyle(fontSize: 25, color: Colors.white),),
                                      )
                                       
                                    ],
                                  ),
                ),
                ]
    );
  }
}