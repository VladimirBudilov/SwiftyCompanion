import 'package:flutter/material.dart';
import 'package:swifty_companion/models/user.dart';

class ProjectsTab extends StatelessWidget {
  final User user;

  const ProjectsTab({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: user.projects.map((project) {
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
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${project.name} / ${project.finalMark}',
                      style: TextStyle(
                        fontFamily: 'MotleyForces',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.asset(
                    project.validated ? 'assets/icons/true.png' : 'assets/icons/false.png',
                    width: 24,
                    height: 24,
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