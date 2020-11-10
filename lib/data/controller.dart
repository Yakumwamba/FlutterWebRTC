import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Controller extends GetxController {

VideoPlayerController _controller;

void initVideoController() {
  _controller =
        VideoPlayerController.asset("assets/videos/login_video_animation.mp4")
          ..initialize().then((_) {
            // Once the video has been loaded we play the video and set looping to true.
            _controller.setLooping(true);
           // _controller.play();

            // Ensure the first frame is shown after the video is initialized.
          });
}

  


}