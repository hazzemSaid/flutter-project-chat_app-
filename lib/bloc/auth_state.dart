part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterInitial extends AuthInitial {}

class RegisterLoading extends AuthInitial {}

class RegisterSuccess extends AuthInitial {}

class RegisterFailure extends AuthInitial {
  String massage;
  RegisterFailure({required this.massage});
}

class SignInInitial extends AuthInitial {}

class SignInLoading extends AuthInitial {}

class SignInSuccess extends AuthInitial {}

class SignInFailure extends AuthInitial {
  String massage;
  SignInFailure({required this.massage});
}
