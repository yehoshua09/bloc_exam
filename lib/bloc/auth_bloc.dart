import 'package:bloc_exam/bloc/auth_event.dart';
import 'package:bloc_exam/bloc/auth_state.dart';
import 'package:bloc_exam/formSubmissionStatus.dart';
import 'package:bloc_exam/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository? authRepo;

  AuthBloc({this.authRepo}) : super(const AuthState()) {
    on<AuthEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(AuthEvent event, Emitter<AuthState> emit) async {
    // Username updated
    if (event is LoginUsernameChanged) {
      emit(state.copyWith(username: event.username));

      // Password updated
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));

      // Email updated
    } else if (event is EmailChanged) {
      emit(state.copyWith(password: event.email));

      // Name updated
    } else if (event is NameChanged) {
      emit(state.copyWith(password: event.name));

      // Save Token
    } else if (event is SaveToken) {
      emit(state.copyWith(password: event.token));
    } else if (event is RegisterPressed) {
      emit(state.copyWith(registerPressed: event.pressed));

      // Form submitted
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(
          username: event.username,
          password: event.password,
          formStatus: FormSubmitting()));

      try {
        String? token = await authRepo?.login(state.username, state.password);
        emit(state.copyWith(formStatus: SubmissionSuccess(), token: token));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    } else if (event is RegisterSubmitted) {
      emit(state.copyWith(
          username: event.username,
          password: event.password,
          name: event.name,
          email: event.email,
          token: event.token,
          formStatus: Register()));

      try {
        print("email ${state.email}");
        await dio.post('https://svc.devsolutions.sds.dev/api/users',
            data: {
              'username': state.username,
              'password': state.password,
              'name': state.name,
              'email': state.email
            },
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer ${state.token}",
            }));

        emit(state.copyWith(formStatus: RegisterSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: RegisterFailed(e)));
      }
    }
  }
}
