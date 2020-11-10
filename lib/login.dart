import 'package:Trend/TrendHome.dart';
import 'package:Trend/email_login_widget.dart';
import 'package:Trend/signupWidget.dart';
import 'package:Trend/trend_icons_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';


import 'package:video_player/video_player.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  // TODO 4: Create a VideoPlayerController object.
  VideoPlayerController _controller;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GetStorage box = GetStorage();
  bool _visible_login;
  bool _visible_signup;
  bool _visible_logo;
  bool _back;
  bool _email_login;

  // TODO 5: Override the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.

    _controller =
        VideoPlayerController.asset("assets/videos/login_video_animation.mp4")
          ..initialize().then((_) {
            //  _controller.
            // Once the video has been loaded we play the video and set looping to true.
            _controller.setLooping(true);
            _controller.play();

            // Ensure the first frame is shown after the video is initialized.
          });
    _visible_signup = false;
    _email_login = false;
    _back = true;
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => TrendHome(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1);
        var end = Offset.zero;
        var curve = Curves.easeInExpo;
        var curve2 = Curves.linearToEaseOut;
        var curve3 = Curves.fastLinearToSlowEaseIn;

        var tween = Tween(begin: begin, end: end)
            .chain(CurveTween(curve: curve))

            // .chain(CurveTween(curve: curve2))
            .chain(CurveTween(curve: curve2));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  void continueWithEmail() {
    setState(() {
      _back = false;
      _email_login = true;
      _visible_signup = false;
    });
  }

  back() {
    setState(() {
      _email_login = false;
      _visible_signup = false;
      _back = true;
    });
  }

  void continueWithSignup() {
    setState(() {
      _email_login = false;
      _visible_signup = true;
      _back = false;
    });
  }

  Future<String> signInWithGoogle() async {
    //await Firebase.initializeApp();
    _controller.pause();
   
    //_controller.dispose();
    if (box.read("logged_in") == true) {
      Get.to(TrendHome());
     
    }else {
          final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      var first_name = user.displayName.split(" ")[0];
      var lastname = user.displayName.split(" ")[1];
      var email = user.email;
      var photoUrl = user.photoURL;
      box.write("username", user.displayName);
      box.write("firstname", first_name);
      box.write("lastname", lastname);
      box.write("logged_in", true);
      box.write("email", email);
      box.write("photoUrl", photoUrl);
      box.write("loggin_type", "GOOGLE");

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');
      Navigator.of(context).push(_createRoute());
      return '$user';
    }

    return null;
    }
    
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () async {
          setState(() {
            _email_login = false;
            _visible_signup = false;
            _back = true;
          });
          return false;
        },
        child: new Scaffold(
          resizeToAvoidBottomPadding: false,
          // TODO 6: Create a Stack Widget
          body: Stack(
            children: <Widget>[
              // TODO 7: Add a SizedBox to contain our video.

              Container(child: Builder(builder: (BuildContext context) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // Add Your Code here.
                  setState(() {});
                });
                return SizedBox.expand(
                  child: FittedBox(
                    // If your background video doesn't look right, try changing the BoxFit property.
                    // BoxFit.fill created the look I was going for.
                    fit: BoxFit.fill,
                    child: SizedBox(
                      width: _controller.value.size?.width ?? 0,
                      height: _controller.value.size?.height ?? 0,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                );
              })),
              Center(
                child: Container(
                  padding:
                      EdgeInsets.only(bottom: 20, top: 70, left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: _back,
                        child: Padding(
                          padding: EdgeInsets.only(top: 40.0),
                          child: Container(
                              height: 150,
                              width: 220,
                              child: Image.asset('assets/logo/logo_white.png')),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Visibility(
                                  visible: _email_login,
                                  child: EmailLoginWidget()),
                              Visibility(
                                  visible: _visible_signup,
                                  child: EmailSignUpWidget()),
                              Visibility(
                                visible: !_back && !_visible_signup,
                                child: InkWell(
                                  onTap: () {
                                    continueWithSignup();
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        "Create account",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: !_back && !_visible_signup,
                                  child: SizedBox(
                                    height: 65,
                                  )),
                              Visibility(
                                visible: _back,
                                child: InkWell(
                                  onTap: () {
                                    continueWithEmail();
                                  },
                                  child: Container(
                                    height: 52,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(7)),
                                      color: Colors.white,
                                      boxShadow: [],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 14, right: 30),
                                          child: Icon(
                                            TrendIcons.email_icon,
                                            size: 15,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Text(
                                          "Continue with Email",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Visibility(
                                visible: _back,
                                child: Container(
                                    height: 50,
                                    child: GoogleSignInButton(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 20),
                                        onPressed: () async {
                                          signInWithGoogle();
                                        },
                                        borderRadius: 8.0)),
                              ),
                              SizedBox(height: 30),
                              Visibility(
                                visible: _back,
                                child: Center(
                                  child: Container(
                                    width: 150,
                                    child: Column(
                                      children: [
                                        Opacity(
                                          opacity: 0.4,
                                          child: Text(
                                            "By continuing you agree with our",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.6,
                                          child: Text(
                                            "Terms and Conditions",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
// TODO 8: Override the dipose() method to cleanup the video controlle
