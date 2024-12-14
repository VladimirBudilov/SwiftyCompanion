import 'package:flutter/material.dart';
import '../models/user.dart';

class UserPage extends StatelessWidget {
  final User user;

  UserPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text('User details: ${user.toString()}'), 
      ),
    );
  }
}