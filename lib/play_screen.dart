import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:get/get.dart';
import 'package:trendradio/trend_icons_icons.dart';
import 'package:http/http.dart' as http;
import 'current_track_info.dart';
import 'data/streaminfo.dart';

class PlayScreen extends StatefulWidget {
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  StreamInfo info;

  String _now;
  String artist;
  Timer _everySecond;

  static const streamUrl = "https://swww.radioking.com/play/trendradio";
  String urlTrackInfo =
      "https://api.radioking.io/widget/radio/trendradio/track/current";
  StreamInfo trackInfo = Get.find();

  

  bool isPlaying;

  bool _is_playing = false;
  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    //get the time for the next song
    //get the current time
    //compare current time to the start time of the song
    //if the current time is in the future of the end time of the song
    //refresh track info
    //splice the start and end time into format h:m
    print("init state");

    //trackInfo.getTrackInfo();
    print(trackInfo.artist);
    print(trackInfo.title);
    print(trackInfo.album);
    print(trackInfo.albumCover);
    // print(trackInfo.getTrackInfo());
    // print(trackInfo.getTrackArtist());

    //
    if (trackInfo.getPlayStatus() == false) {
      audioStart();
    }

    //FlutterRadio.playOrPause(url: streamUrl);

    //initTrackInfo();
    //timer();
    // print(info.getTrackArtist());
    // sets first value
    // _now = DateTime.now().second.toString();

    // defines a timer
  }

  Future<void> audioStart() async {
    
    await FlutterRadio.audioStart();
    await FlutterRadio.playOrPause(url: streamUrl);
    print('Audio Start OK');

    if(!trackInfo.getPlayStatus()){
        trackInfo.setPlayStatusTrue();
    }
    
  }

  Future<dynamic> getTrackInfo() async {
    final response = await http.get(urlTrackInfo);
    final Map parsed = json.decode(response.body);
    print(parsed);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFFe54f4f), Color(0XFF661980)]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  TrendIcons.arrow_down,
                  size: 10,
                  color: Colors.grey[100],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 5),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.010),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ],
                    color: Color(0xfff79f00),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    image: DecorationImage(
                      image: NetworkImage(trackInfo.getAlbumCover()),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            CurrentTrack(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(
                      TrendIcons.rewind,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Image.asset(
                    'assets/images/live.png',
                    scale: 0.8,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(TrendIcons.forward, size: 20),
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
