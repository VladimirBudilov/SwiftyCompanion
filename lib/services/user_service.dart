import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swifty_companion/models/user.dart';

class UserService {
  final String _baseUrl = 'https://api.intra.42.fr/v2';

  Future<User?> getUserByLogin(String login) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/users/$login'));

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
