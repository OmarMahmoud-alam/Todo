part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucceful extends LoginState {}

class LoginFail extends LoginState {}

class ChangePasswordVisibility extends LoginState {}
