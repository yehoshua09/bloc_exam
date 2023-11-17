import 'package:bloc_exam/bloc/auth_bloc.dart';
import 'package:bloc_exam/bloc/auth_event.dart';
import 'package:bloc_exam/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameField extends StatelessWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Name',
          ),
          validator: (value) => state.isValidName ? null : 'Name is too short',
          onChanged: (value) => context.read<AuthBloc>().add(
                NameChanged(name: value),
              ),
        );
      },
    );
  }
}
