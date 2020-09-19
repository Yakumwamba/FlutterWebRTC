import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_builder/timer_builder.dart';

import 'data/streaminfo.dart';

class CurrentTrack extends StatefulWidget {


  @override
  _CurrentTrackState createState() => _CurrentTrackState();
}

class _CurrentTrackState extends State<CurrentTrack> {
   DateTime startTime;
   DateTime endTime;

  

  StreamInfo trackInfo = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (trackInfo.loaded == true) {
      startTime = trackInfo.startTime;
      endTime = trackInfo.startTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.scheduled([], builder: (context) {
      return Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Sofia_regular'),
            ),
            SizedBox(
              height: 2,
            ),
            Text("",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Sofia_regular')),
            SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width,
              height: 3,
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(5)),
            )
          ],
        ),
      );
    });
  }
}
