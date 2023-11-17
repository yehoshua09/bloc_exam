import 'package:dio/dio.dart';

final dio = Dio();

final class UserRepository {
  Future<String> login(String username, String password) async {
    final response = await dio.post(
        'https://svc.devsolutions.sds.dev/api/auth/signin',
        data: {'username': username, 'password': password});

    return response.toString();
  }
}
