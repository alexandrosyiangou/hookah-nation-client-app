import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class UnAuthenticatedLoading extends AuthState {}

class UnAuthenticatedLoaded extends AuthState {}

class LoggedIn extends AuthState {}

class SignedUp extends AuthState {}
