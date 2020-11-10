import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

abstract class RadioPlayer extends GetxController {
  Future<void> play({@required String url});
  Future<void> pause();
}