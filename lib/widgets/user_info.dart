import 'package:flutter/material.dart';
import 'package:swifty_companion/widgets/clickable_text.dart';
import '../models/user.dart';

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('User Information:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('Username: ${user.login}', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Text('Full Name: ${user.fullName}', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Text('Email: ${user.email}', style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Image.network(user.imageUrl),
        const SizedBox(height: 16),
        if (user.campus != null) ...[
          const Text('Campus Information:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ClickableText(
            text: 'Campus Name: ${user.campus!.name}',
            url: user.campus!.website,
          ),
          const SizedBox(height: 8),
          Text('Address: ${user.campus!.address}',
              style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          Text('City: ${user.campus!.city}', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}
