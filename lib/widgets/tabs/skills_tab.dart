import 'package:flutter/material.dart';
import 'package:swifty_companion/models/user.dart';

class SkillsTab extends StatelessWidget {
  final User user;

  const SkillsTab({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: user.skills.map((skill) {
            return ListTile(
              title: Text(skill.name),
              subtitle: Text('Level: ${skill.level.toStringAsFixed(2)}'),
            );
          }).toList(),
        ),
      ),
    );
  }
}