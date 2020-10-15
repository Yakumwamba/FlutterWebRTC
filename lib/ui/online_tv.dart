import 'package:flutter/material.dart';

import '../trend_icons_icons.dart';

class OnlineTv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        
        decoration: BoxDecoration(
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.20),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          image: DecorationImage(
              image: AssetImage(
                'assets/images/online_tv.jpg',
              ),
              fit: BoxFit.fitWidth,
              alignment:
                  Alignment.lerp(Alignment.center, Alignment.topLeft, 0.60),
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken)),
        ),
      ),
      Container(
        child: Padding(
          padding:EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 20),
                child: Icon(
                  TrendIcons.online_tv,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 45,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Online TV",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      "Coming soon",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

// return Container(
//       child: Padding(
//         padding: const EdgeInsets.all(3.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 26),
//               child: Icon(
//                 TrendIcons.online_tv,
//                 size: 25,
//               ),
//             ),
//             SizedBox(
//               width: 60,
//             ),
//             Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     "Online TV",
//                     style: TextStyle(fontSize: 25),
//                   ),
// Text(
//   "Coming soon",
//   style: TextStyle(fontSize: 10),
// ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
