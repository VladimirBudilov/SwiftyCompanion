import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:swifty_companion/models/user.dart';
import 'auth_interceptor.dart';
import 'auth_service.dart';

class UserService {
  static final UserService _instance = UserService._internal();
  final String _baseUrl = 'https://api.intra.42.fr/v2';
  late final http.Client _client;

  factory UserService(AuthService authService) {
    _instance._initialize(authService);
    return _instance;
  }

  UserService._internal();

  void _initialize(AuthService authService) {
    _client = InterceptedClient.build(
      interceptors: [AuthInterceptor(authService)],
      requestTimeout: Duration(seconds: 30),
    );
  }

  Future<User?> getUserByLogin(String login) async {
    try {
      final response = await _client.get(Uri.parse('$_baseUrl/users/$login'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return User.fromJson(data);
      } else {
        print('Ошибка: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Ошибка запроса: $e');
      return null;
    }
  }
}