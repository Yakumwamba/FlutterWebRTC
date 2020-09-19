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

  static const streamUrl = "https://www.radioking.com/play/trendradio";
  String urlTrackInfo =
      "https://api.radioking.io/widget/radio/trendradio/track/current";

  StreamInfo trackInfo = Get.find();
  bool isPlaying;
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

    trackInfo.getTrackInfo();
    print(trackInfo.artist);
    print(trackInfo.title);
    print(trackInfo.album);
    // print(trackInfo.getTrackInfo());
    // print(trackInfo.getTrackArtist());

    //
    // audioStart();

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
    print('Audio Start OK');
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

  void initTrackInfo() {
    info = StreamInfo();
  }

  void timer() {
    _everySecond = Timer.periodic(Duration(seconds: 20), (Timer t) {
      info.getTrackInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
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
                padding: const EdgeInsets.only(top: 40, bottom: 5, right: 15),
                child: Icon(
                  TrendIcons.arrow_down,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
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
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage(info.albumCover))),
                  child: Flexible(
                    child: Center(
                        child: Image.asset(
                      'assets/logo/logo_white.png',
                      fit: BoxFit.contain,
                      width: 200,
                      height: 200,
                    )),
                  ),
                ),
              ),
              CurrentTrack()
            ],
          ),
        ),
      ),
    );
  }
}
