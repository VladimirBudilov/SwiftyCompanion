import 'package:flutter/material.dart';
import 'package:swifty_companion/widgets/clickable_text.dart';
import '../models/user.dart';

class UserInfo extends StatelessWidget {
  final User user;

  UserInfo({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('User Information:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Username: ${user.login}', style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Text('Full Name: ${user.fullName}', style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Text('Email: ${user.email}', style: TextStyle(fontSize: 16)),
        SizedBox(height: 8),
        Image.network(user.imageUrl),
        SizedBox(height: 16),
        if (user.campus != null) ...[
          Text('Campus Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          ClickableText(
            text: 'Campus Name: ${user.campus!.name}',
            url: user.campus!.website,
          ),
          SizedBox(height: 8),
          Text('Address: ${user.campus!.address}',
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text('City: ${user.campus!.city}', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
        ],
      ],
    );
  }
}
