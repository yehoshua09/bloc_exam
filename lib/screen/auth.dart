import 'package:bloc_exam/bloc/auth_bloc.dart';
import 'package:bloc_exam/bloc/auth_state.dart';
import 'package:bloc_exam/formSubmissionStatus.dart';
import 'package:bloc_exam/screen/home.dart';
import 'package:bloc_exam/user_repository.dart';
import 'package:bloc_exam/widget/formWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(authRepo: context.read<UserRepository>()),
          )
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listenWhen: (previous, current) =>
                  previous.formStatus != current.formStatus,
              listener: (context, state) {
                final formStatus = state.formStatus;
                if (formStatus is SubmissionFailed) {
                  _showSnackBar(context, formStatus.exception.toString());
                }
                if (formStatus is SubmissionSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(token: state.token)),
                  );
                }
              },
            ),
          ],
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: x * .4,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 30,
                    right: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: x * .1),
                      child: Image.asset(
                        "assets/parrot.jpg",
                        // fit: BoxFit.fill,
                      ),
                    ),
                    const AuthForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
