import 'package:bloc_exam/bloc/auth_bloc.dart';
import 'package:bloc_exam/bloc/auth_event.dart';
import 'package:bloc_exam/bloc/auth_state.dart';
import 'package:bloc_exam/formSubmissionStatus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key, required this.formKey}) : super(key: key);

  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.formStatus is Register
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(RegisterSubmitted());
                  }
                },
                child: const Text('Register'),
              );
      },
    );
  }
}
