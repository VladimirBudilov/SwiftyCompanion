import 'dart:async';
import '../models/user.dart';

class UserService {
  Future<User?> fetchUser(String username) async {
    // Mock response
    await Future.delayed(const Duration(seconds: 1));
    if (username == "valid_user") {
      return User(
        login: "valid_user",
        email: "valid_user@example.com",
        mobile: "+123456789",
        level: "Beginner",
      );
    }
    return null;
  }
}
