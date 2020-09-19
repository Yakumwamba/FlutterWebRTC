

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthState extends GetxController {

AuthState();


  String _setEmailAdress = "";
  String _image_url;
  String _displayName = "sadasdadadasd";
  String _email = "";

  void setDisplayName(String text) {
    _displayName = text;
    //notifyListeners();
  }

   void setEmailAddress(String email) {
    _setEmailAdress = email;
    //notifyListeners();
  }
   void setImageUrl(String url) {
    _image_url = url;
    //notifyListeners();
  }
    String get getDisplayName => _displayName;
    String get getEmailAddress => _setEmailAdress;
    String get getImageUrl => _image_url;
}