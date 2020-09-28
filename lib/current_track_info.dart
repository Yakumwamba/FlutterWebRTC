import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:trendradio/trend_icons_icons.dart';

import 'data/streaminfo.dart';

class CurrentTrack extends StatefulWidget {
  @override
  _CurrentTrackState createState() => _CurrentTrackState();
}

class _CurrentTrackState extends State<CurrentTrack> {
  DateTime startTime;
  DateTime endTime;

  StreamInfo trackInfo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trackInfo = Get.find();
    //trackInfo.getTrackInfo();
  }

  Widget _showTrackAlbum() {
    return Text(
        trackInfo.getTrackAlbum() != null
            ? "${trackInfo.getTrackAlbum()}"
            : "---",
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontFamily: 'Sofia_regular'));
  }

  Widget _showTrackArtist() {
    return Text(
        trackInfo.getTrackArtist() != null
            ? "${trackInfo.getTrackArtist()}"
            : "---",
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontFamily: 'Sofia_regular'));
  }

  Widget _showSeparator() {
    return Text(" - ",
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontFamily: 'Sofia_regular'));
  }

  @override
  Widget build(BuildContext context) {
    int difference = 1;
    if (trackInfo.getTrackTitle() == null) {
      difference = 10;
    }
    return TimerBuilder.periodic(Duration(seconds: difference),
        builder: (context) {
      if (trackInfo.loaded == true) {
        //startTime = trackInfo.startTime;
        endTime = trackInfo.endTime;
        DateTime now = DateTime.now().toUtc();
        if (now.isAfter(endTime)) {
          trackInfo.getTrackInfo();
          difference = endTime.difference(now).inSeconds;
        }
      }
      return Container(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              trackInfo.getTrackTitle() != null
                  ? trackInfo.getTrackTitle()
                  : "---",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sofia_regular'),
            ),
            SizedBox(
              height: 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _showTrackArtist(),
                _showSeparator(),
                _showTrackAlbum()
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              width: Get.width,
              height: 3,
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ],
        ),
      );
    });
  }
}
