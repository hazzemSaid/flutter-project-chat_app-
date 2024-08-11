part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class login extends AuthEvent {
  String email;
  String password;
  login({required this.email, required this.password});
}

class register extends AuthEvent {
  String email;
  String password;
  register({required this.email, required this.password});
}
