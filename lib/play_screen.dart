import 'dart:async';
import 'dart:convert';

import 'package:Trend/radio/flutter_radio_player.dart';
import 'package:Trend/trend_icons_icons.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:timer_builder/timer_builder.dart';


import 'package:http/http.dart' as http;

import 'data/streaminfo.dart';

class PlayScreen extends StatefulWidget {
  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  StreamInfo info;
  static const String routeName = 'PlayScreen';
  String _now;
  String artist;
  Timer _everySecond;

  static const streamUrl =
      "https://listen.radioking.com/radio/341680/stream/390271";
  String urlTrackInfo =
      "https://api.radioking.io/widget/radio/trendradio/track/current";
  StreamInfo trackInfo = Get.find();
  FlutterRadioPlayer player = Get.find();

  bool isPlaying;
  bool _is_playing = false;
  bool updatedNotfication = false;

  //final audio = Audio(streamUrl);
  //final assetsAudioPlayer = AssetsAudioPlayer();
  String albumArt = "";
  int difference = 50;
  DateTime endTime;
  bool loaded = false;
  @override
  void initState() {
    //TODO: implement initState2
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

    if(trackInfo.loaded == false) {
      trackInfo.getTrackInfo();    }
   

    // defines a timer
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
    // if (trackInfo.getTrackTitle() == null) {
    //   difference = 10;
    //   trackInfo.getTrackInfo();
    // }
//  if (trackInfo.loaded == true) {
//       trackInfo.getTrackInfo().then( (value) {
//            WidgetsBinding.instance.addPostFrameCallback((_) {
//                               setState(() {
//                               loaded = true;
//                               });
                         
//                             });
//       });
//     }
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Container(height: Get.height, width: Get.width, color: Colors.white),
          Container(
              height: Get.width * 0.80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.20),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xFFf79f00),
                        Color(0XFFe54f4f),
                      ]),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(Get.width * 3, 90)))),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 20),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            TrendIcons.back_arrow,
                            size: 20,
                            color: Colors.grey[100],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: 20.0, right: 20, bottom: 2),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 1.2,
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
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          image: DecorationImage(
                            image:  trackInfo.loaded 
                                ? NetworkImage(
                                    albumArt,
                                  )
                                : AssetImage("assets/images/play_cover.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: trackInfo.loaded == false
                            ? Center(
                                child: SpinKitFadingCircle(itemBuilder:
                                    (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: index.isEven
                                          ? Colors.orange
                                          : Colors.yellow,
                                    ),
                                  );
                                }),
                              )
                            : null,
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      TimerBuilder.periodic(Duration(seconds: difference != 1 ? difference : 2),
                          builder: (context) {
                        DateTime startTime;

                        //checkConnection();

                        DateTime now = DateTime.now().toUtc();
                        endTime = trackInfo.endTime;
                        if (trackInfo.loaded == true) {
                          //startTime = trackInfo.startTime;
                          //trackInfo.getTrackInfo();
                          // player.updateMeta(
                          //     title: trackInfo.getTrackTitle(),
                          //     artist: trackInfo.getTrackArtist());

                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              endTime = trackInfo.endTime;
                              albumArt = trackInfo.getAlbumCover();
                              updatedNotfication = true;
                            });
                            // Add Your Code here.
                            if (updatedNotfication) {
                              player.updateMeta(
                                image: MetasImage.network(albumArt),
                                title: trackInfo.getTrackTitle(),
                                artist: trackInfo.getTrackArtist(),
                              );
                            }
                          });

                          if (now.isAfter(endTime)) {
                            trackInfo.getTrackInfo().then((value) {
                              endTime = trackInfo.endTime;
                                difference = endTime.difference(now).inSeconds;
                            });

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                              
                                albumArt = trackInfo.getAlbumCover();
                                updatedNotfication = true;
                              });
                              player.updateMeta(
                                image: MetasImage.network(albumArt),
                                title: trackInfo.getTrackTitle(),
                                artist: trackInfo.getTrackArtist(),
                              );
                            });
                            //trackInfo.getTrackInfo();
                            // trackInfo.updateMetaData();

                            // trackInfo.reloadedTrue();

                          } else {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              setState(() {
                                // albumArt = trackInfo.getAlbumCover();

                                updatedNotfication = false;
                              });
                            });
                          }
                        }else {
                       

                           WidgetsBinding.instance.addPostFrameCallback((_) {
                                trackInfo.getTrackInfo();
                          setState(() {});
                            });
                        }

                        return Column(
                          children: [
                            Text(
                              "${trackInfo.getTrackTitle() != null ? trackInfo.getTrackTitle() : 'Unknown Title'}",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2.0),
                                  child: trackInfo.getTrackTitle() != null
                                      ? Text(
                                          "${trackInfo.getTrackTitle()} - ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal),
                                        )
                                      : Text("Loading"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    "${trackInfo.getTrackArtist() != null ? trackInfo.getTrackArtist() : 'Unknown Artist'}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20, top: 10),
                              child: Container(
                                width: Get.width,
                                height: 1,
                                color: Color(0xff262626),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text('live'),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: IconButton(
                              color: Colors.black,
                              icon: Icon(
                                TrendIcons.rewind,
                                size: 20,
                              ),
                              onPressed: () {
                                final rewind = Duration(seconds: -20);

                                try {
                                  print("REWIND 20 SECONDS");
                                  player.rewindSeconds(rewind);
                                } catch (e) {
                                  print(e);
                                }

                                //assetsAudioPlayer.playOrPause();
                                return;
                              },
                            ),
                          ),
                          Text("-20", style: TextStyle(color: Colors.black)),
                          StreamBuilder(
                            stream: player.getAudioPlayer().isPlaying == null
                                ? false
                                : player.getAudioPlayer().isPlaying,
                            builder: (context, asyncSnapshot) {
                              final bool isPlaying = asyncSnapshot.data;

                              if (!isPlaying.isNullOrBlank && isPlaying) {
                                //Get.log("Player has starting playing");
                              }
                              return Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: InkWell(
                                  onTap: () async {
                                    // if (assetsAudioPlayer.isPlaying.value == true) {
                                    //   print("STOPPING");
                                    //   assetsAudioPlayer.stop();
                                    //   _is_playing = false;
                                    //   // trackInfo.stop();
                                    //   trackInfo.setPlayStatusFalse();
                                    //   return;
                                    // } else if (assetsAudioPlayer.isPlaying.value ==
                                    //     false) {
                                    //   assetsAudioPlayer.playOrPause();
                                    //   trackInfo.setPlayStatusTrue();
                                    //   return;
                                    // }
                                    // context.bloc<PlayerBloc>().add(PlayEvent(url: _planetRockUrl));
                                    if (isPlaying) {
                                      Get.log("Removing the player");
                                      player.pause();
                                    } else {
                                      await player.initializeAudioPlayer(
                                          url: streamUrl);
                                    }

                                    // if (player.value) {
                                    //   print("Player is buffering");
                                    // }
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Container(
                                      child: Center(
                                          child: isPlaying
                                              ? Center(
                                                  child: Icon(
                                                    TrendIcons.pause,
                                                    color: Colors.orange,
                                                  ),
                                                )
                                              : Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 3, right: 23),
                                                    child: Icon(
                                                        TrendIcons.play_button,
                                                        size: 72,
                                                        color: Colors.orange),
                                                  ),
                                                )),
                                      height: 72,
                                      width: 72,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(80),
                                          color: Colors.white),
                                    )),
                                    height: 75,
                                    width: 75,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.orange),
                                  ),
                                ),
                              );
                            },
                          ),
                          Text(
                            "+20",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 40),
                            child: IconButton(
                              color: Colors.grey,
                              icon: Icon(TrendIcons.forward, size: 20),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
