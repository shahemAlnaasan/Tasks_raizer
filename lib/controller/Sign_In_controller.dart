import 'package:flutter/material.dart';

class SignInController {
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static GlobalKey<FormState> formState = GlobalKey();

  static bool isButtonStill = true;
  static void removeButton() {
    isButtonStill = false;
  }
}
