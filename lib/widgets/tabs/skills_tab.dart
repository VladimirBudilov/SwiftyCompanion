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
            final completionPercentage = (skill.level / 20) * 100;
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill.name,
                    style: const TextStyle(
                      fontFamily: 'MotleyForces',
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Level: ${skill.level.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontFamily: 'ChristmasStories',
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Completion: ${completionPercentage.toStringAsFixed(2)}%',
                    style: const TextStyle(
                      fontFamily: 'ChristmasStories',
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}