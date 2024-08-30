import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/controller/sign_in_controller.dart';

part 'login_button_state.dart';

class LoginButtonCubit extends Cubit<LoginButtonState> {
  LoginButtonCubit() : super(ButtonState());

  void showUserInfo() {
    emit(UserInfoState(
        userName: SignInController.usernameController.text,
        password: SignInController.passwordController.text));
  }
}
