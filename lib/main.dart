import 'package:bloc_exam/user_repository.dart';
import 'package:bloc_exam/screen/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Exam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        primarySwatch: Colors.amber,
      ),
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: const AuthScreen(),
      ),
    );
  }
}
