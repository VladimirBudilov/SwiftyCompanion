import 'dart:async';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  late final oauth2.Client _client;

  Future<void> init() async {
    final uid = dotenv.env['API_UID']!;
    final secret = dotenv.env['API_SECRET']!;
    final tokenEndpoint = Uri.parse(dotenv.env['API_URL']!);

    _client = await oauth2.clientCredentialsGrant(
      tokenEndpoint,
      uid,
      secret,
    );
  }

  Future<String?> getAccessToken() async {
    try {
      return _client.credentials.accessToken;
    } catch (e) {
      return null;
    }
  }

  Future<String?> refreshToken() async {
    try {
      final uid = dotenv.env['API_UID']!;
      final secret = dotenv.env['API_SECRET']!;
      final tokenEndpoint = Uri.parse(dotenv.env['API_URL']!);

      _client = await oauth2.clientCredentialsGrant(
        tokenEndpoint,
        uid,
        secret,
      );
      return _client.credentials.accessToken;
    } catch (e) {
      return null;
    }
  }
}
