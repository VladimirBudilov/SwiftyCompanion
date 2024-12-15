import 'package:flutter/material.dart';
import 'package:swifty_companion/models/user.dart';

class SkillsTab extends StatelessWidget {
  final User user;

  SkillsTab({required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: user.skills.length ?? 0,
      itemBuilder: (context, index) {
        final skill = user.cursus!.skills[index];
        return ListTile(
          title: Text(skill.name),
          subtitle: Text('Level: ${skill.level.toStringAsFixed(2)}'),
        );
      },
    );
  }
}