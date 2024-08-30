part of 'login_button_bloc.dart';

@immutable
sealed class LoginButtonState {}

class ButtonState extends LoginButtonState {}

class UserInfoState extends LoginButtonState {
  final String userName;
  final String password;

  UserInfoState({required this.userName, required this.password});
}
