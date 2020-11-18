import 'package:flutter/material.dart';

class Transitions {

static Route createRoute(Widget route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1);
      var end = Offset.zero;
      var curve = Curves.easeInExpo;
      var curve2 = Curves.linearToEaseOut;
      var curve3 = Curves.fastLinearToSlowEaseIn;

      var tween = Tween(begin: begin, end: end)
          .chain(CurveTween(curve: curve))
          
          // .chain(CurveTween(curve: curve2))
          .chain(CurveTween(curve: curve2));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


}