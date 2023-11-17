import 'package:bloc_exam/widget/emailField.dart';
import 'package:bloc_exam/widget/nameField.dart';
import 'package:bloc_exam/widget/passwordField.dart';
import 'package:bloc_exam/widget/signUp.dart';
import 'package:bloc_exam/widget/usernameField.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey1 = GlobalKey<FormState>();

    return Form(
      key: formKey1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const UsernameField(),
          const PasswordField(),
          const NameField(),
          const EmailField(),
          const SizedBox(height: 15),
          SignUp(formKey: formKey1),
        ],
      ),
    );
  }
}
