import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class LoginUsernameChanged extends AuthEvent {
  final String? username;

  LoginUsernameChanged({this.username});

  @override
  List<Object?> get props => [username];
}

class RegisterPressed extends AuthEvent {
  final bool pressed;
  RegisterPressed({required this.pressed});

  @override
  List<Object?> get props => [pressed];
}

class NameChanged extends AuthEvent {
  final String? name;

  NameChanged({this.name});

  @override
  List<Object?> get props => [name];
}

class EmailChanged extends AuthEvent {
  final String? email;

  EmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class SaveToken extends AuthEvent {
  final String? token;

  SaveToken({this.token});

  @override
  List<Object?> get props => [token];
}

class LoginPasswordChanged extends AuthEvent {
  final String? password;

  LoginPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class RegisterSubmitted extends AuthEvent {
  final String? username;
  final String? password;
  final String? name;
  final String? email;
  final String? token;

  RegisterSubmitted(
      {this.username, this.password, this.name, this.email, this.token});
  @override
  List<Object?> get props => [username, password, name, email, token];
}

class LoginSubmitted extends AuthEvent {
  final String? username;
  final String? password;

  LoginSubmitted({this.username, this.password});
  @override
  List<Object?> get props => [username, password];
}
