import '../views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';


class SplashController extends FxController {
  @override
  String getTag() {
    return "splash_controller";
  }


  void goToLogin() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}