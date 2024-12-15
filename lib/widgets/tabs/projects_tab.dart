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
            return ListTile(
              title: Text(project.name),
              subtitle: Text('Final Mark: ${project.finalMark}\nStatus: ${project.status}'),
              trailing: project.validated ? Icon(Icons.check, color: Colors.green) : Icon(Icons.close, color: Colors.red),
            );
          }).toList(),
        ),
      ),
    );
  }
}