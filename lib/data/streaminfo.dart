import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StreamInfo extends GetxController {
  String url = "https://api.radioking.io/widget/radio/trendradio/track/current";
  var artist = "";
  var title = "";
  var duration = "";
  var album = "";
  String albumCover = "";
  bool loaded = false;
  DateTime startTime;
  DateTime endTime;



//USER FACEBOOK INFO

String name;
String profilePicUrl;
String email;

void setName(String name) {
  this.name = name;

}

void setProfilePicUrl(String profilePicUrl) {
  this.profilePicUrl = profilePicUrl;

}
void setEmail(String email) {
  this.email = email;

}
  bool termsAndConditions = false;

  void setTermsAndConditionsTrue(bool accepted) {
    this.termsAndConditions = accepted;
  }

  //{name: Brian Lemba,
  //  first_name: Brian, last_name: Lemba, 
  //  picture: {data: {height: 960, is_silhouette: false, 
  //  url: https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=3668301613179983&height=800&width=800&ext=1603066254&hash=AeRKgrX48dEiNBps, width: 960}}, 
  //email: brian.lemba@yahoo.com, id: 3668301613179983}

  StreamInfo(
      {this.artist, this.title, this.duration, this.album, this.startTime});
  factory StreamInfo.fromJson(Map<String, dynamic> parsedJson) {
    return StreamInfo(
      artist: parsedJson['artist'],
      title: parsedJson['title'],
      album: parsedJson['album'],
      //startTime: DateTime(parsedJson['startTime'])
    );
  }

  void setArtist(artist) {
    this.artist = artist;
  }

  void setTitle(title) {
    this.title = title;
  }

  void setAlbum(album) {
    this.album = album;
  }

  getTrackArtist() {
    return this.artist;
  }

  getTrackAlbum() {
    return this.album;
  }

  getTrackTitle() {
    return this.title;
  }

  Future<dynamic> getTrackInfo() async {
    final response = await http.get(this.url);
    final Map parsed = json.decode(response.body);

    final trackInfo = StreamInfo.fromJson(parsed);
    //setArtist(trackInfo.artist);
    if (response.statusCode == 200) {
      print(parsed);
      //print(trackInfo.getTrackAlbum());
      setArtist(parsed['artist']);
      setTitle(parsed['title']);
      setAlbum(parsed['album']);
    }

    //print(getTrackArtist());
    return trackInfo;
    //get the time for the next song
    //get the current time
    //compare current time to the start time of the song
    //if the current time is in the future of the end time of the song
    //refresh track info
    //splice the start and end time into format h:m
    //
  }
}
