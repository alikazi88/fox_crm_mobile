import 'package:flutkit/m3/estate/views/full_app_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

class ForgotPasswordController extends FxController {
  late TextEditingController emailController = TextEditingController();

  @override
  String getTag() {
    return "forgot_password_controller";
  }

  void goToHome() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(builder: (context) => FullAppScreen()),
    );
  }
}
