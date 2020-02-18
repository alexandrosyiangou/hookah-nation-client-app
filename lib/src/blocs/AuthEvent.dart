import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AnonymousAuth extends AuthEvent {}

class Login extends AuthEvent {
  final String username;
  final String password;

  const Login({
    this.username,
    this.password,
  });

  @override
  List<Object> get props => [username, password];

  @override
  String toString() => 'Login event';
}

class Signup extends AuthEvent {
  final String username;
  final String password;
  final String confirmPassword;

  const Signup({
    this.username,
    this.password,
    this.confirmPassword,
  });

  @override
  List<Object> get props => [username, password, confirmPassword];

  @override
  String toString() => 'Signup event';
}