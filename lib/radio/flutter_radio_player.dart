import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FlutterRadioPlayer extends GetxController {
  final audioPlayer = new AssetsAudioPlayer();
  var _isUrlSet = false;
  var isPlaying = false;
  var isInitialized = false;

  Audio audio =
      Audio.network("https://listen.radioking.com/radio/341680/stream/390271");

  Future<void> pause() {
    return audioPlayer.pause().then((value) => isPlaying = false);
  }

  // Future<void> play({@required String url}) async {
  //   if (!isInitialized) {
  //     await audioPlayer.open(Audio(url),
  //         notificationSettings: NotificationSettings(
  //           prevEnabled: false,
  //         ));
  //     isInitialized = true;
  //   }
  // }

  initializeAudioPlayer({@required String url}) async {
    try {
      await audioPlayer
          .open(audio,
              showNotification: true,
              notificationSettings: NotificationSettings(
                  seekBarEnabled: true,
          ))
          .then((value) => this.isInitialized == true);
    } catch (e) {
      Get.log("Error playing audio" + e);
    }

    //isInitialized = true;
  }

  AssetsAudioPlayer getAudioPlayer() {
    return audioPlayer;
  }

  void updateMeta({artist, title, image}) {
    audio.updateMetas(title: title, artist: artist, image: image);
  }

  void setPlayingFalse() {
    this.isPlaying = false;
  }

  void setPlayingTrue() {
    this.isPlaying = true;
  }

  void stop() {
    audioPlayer.stop().then((value) => this.isPlaying = false);
  }

  void rewindSeconds(Duration seconds) {
    audioPlayer.seek(seconds);
  }

  bool playStatus() {
    return audioPlayer.isPlaying.value;
  }
}
