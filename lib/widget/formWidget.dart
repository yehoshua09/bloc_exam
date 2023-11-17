import 'package:bloc_exam/widget/loginButton.dart';
import 'package:bloc_exam/widget/passwordField.dart';
import 'package:bloc_exam/widget/usernameField.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const UsernameField(),
          const PasswordField(),
          const SizedBox(height: 15),
          LoginButton(formKey: formKey),
        ],
      ),
    );
  }
}
