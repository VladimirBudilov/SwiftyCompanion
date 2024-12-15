import 'package:flutter/material.dart';
import 'package:swifty_companion/models/user.dart';

class ProjectsTab extends StatelessWidget {
  final User user;

  ProjectsTab({required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Projects for ${user.fullName}'),
    );
  }
}