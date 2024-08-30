import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_one/controller/sign_in_controller.dart';

part 'login_button_event.dart';
part 'login_button_state.dart';

// This Bloc is used to show Login Button and replace it with User name and passowrd when pressing on it

class LoginButtonBloc extends Bloc<LoginButtonEvent, LoginButtonState> {
  LoginButtonBloc() : super(ButtonState()) {
    on<LoginButtonEvent>((event, emit) {
      if (event is ShowButtonEvent) {
        emit(ButtonState());
      }
      if (event is ShowUSerInfo) {
        emit(UserInfoState(
            userName: SignInController.usernameController.text,
            password: SignInController.passwordController.text));
      }
    });
  }
}
