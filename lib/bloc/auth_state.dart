import 'package:bloc_exam/formSubmissionStatus.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final String username;
  bool get isValidUsername => username.length > 3;

  final String password;
  bool get isValidPassword => password.length > 4;

  final String name;
  bool get isValidName => name.length < 3;

  final String email;
  bool get isValidEmail => email.length < 3;

  final FormSubmissionStatus formStatus;
  final bool registerPressed;
  final String token;

  const AuthState({
    this.username = '',
    this.password = '',
    this.name = '',
    this.email = '',
    this.token = '',
    this.registerPressed = false,
    this.formStatus = const InitialFormStatus(),
  });

  AuthState copyWith({
    String? username,
    String? password,
    String? name,
    String? email,
    String? token,
    bool? registerPressed,
    FormSubmissionStatus? formStatus,
  }) {
    return AuthState(
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
      registerPressed: registerPressed ?? this.registerPressed,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props =>
      [username, password, name, email, token, formStatus];
}
