import 'package:bloc_exam/bloc/auth_bloc.dart';
import 'package:bloc_exam/bloc/auth_event.dart';
import 'package:bloc_exam/screen/signUp.dart';
import 'package:bloc_exam/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, this.token}) : super(key: key);
  String? token;
  @override
  Widget build(BuildContext context) {
    Future<dynamic> getUsers() async {
      final response =
          await dio.get('https://svc.devsolutions.sds.dev/api/users',
              options: Options(headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $token",
              }));
      return response.data;
    }

    context.read<AuthBloc>().add(SaveToken(token: token));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<SignUpScreen>(builder: (context2) {
              return BlocProvider.value(
                value: AuthBloc(),
                child: const SignUpScreen(),
              );
            }),
          );
        },
      ),
      appBar: AppBar(
        title: const Text(
          "Bloc Exam",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[200],
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              String? x = snapshot.data[index]["Name"];
              return ListTile(
                title: Text(
                  x.toString(),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await dio.put(
                        'https://svc.devsolutions.sds.dev/api/users/change/status/${snapshot.data[index].id}',
                        data: {"is_active": false},
                        options: Options(headers: {
                          "Content-Type": "application/json",
                          "Authorization": "Bearer $token",
                        }));
                  },
                ),
              );
            },
            itemCount: snapshot.data.length,
          );
        },
        future: getUsers(),
      ),
    );
  }
}
