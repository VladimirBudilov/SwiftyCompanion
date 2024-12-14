import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() {
  runApp(UserSearchApp());
}

class UserSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Search App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
