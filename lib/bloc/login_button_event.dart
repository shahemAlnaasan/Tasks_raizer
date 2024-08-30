part of 'login_button_bloc.dart';

@immutable
sealed class LoginButtonEvent {}

class ShowButtonEvent extends LoginButtonEvent {}

class ShowUSerInfo extends LoginButtonEvent {}
