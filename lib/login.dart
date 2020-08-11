

import 'package:flutter/material.dart';
import 'package:trendradio/trend_icons_icons.dart';
import 'package:trendradio/ui/login_widget.dart';
import 'package:video_player/video_player.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  // TODO 4: Create a VideoPlayerController object.
  VideoPlayerController _controller;

  // TODO 5: Override the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/videos/login_video_animation.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.setLooping(true);
        _controller.play();
        
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }


  @override
  Widget build(BuildContext context) {
    

    return new Scaffold(
          // TODO 6: Create a Stack Widget
          body: new Stack(
            children: <Widget>[
              // TODO 7: Add a SizedBox to contain our video.
              SizedBox.expand(
                child: FittedBox(
                  // If your background video doesn't look right, try changing the BoxFit property.
                  // BoxFit.fill created the look I was going for.
                  fit: BoxFit.fill,
                  child:  SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),

               Positioned(
                top: 130,
                left: 80,
                right: 80,
                bottom: 400,
                child: Container(
                  height: 200,
                  width: 300,
                  child: Image.asset('assets/logo/logo_white.png')),
              ),

              Positioned(
                 right: 40, left: 40, top: 410,
                  child: LoginWidget(),
                  
              )
  
             
            ],
          ),
   
      
    );
  }

  // TODO 8: Override the dipose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
