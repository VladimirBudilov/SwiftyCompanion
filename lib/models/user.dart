import 'campus.dart';
import 'cursus.dart';
import 'project.dart';
import 'skill.dart';

class User {
  final int id;
  final String login;
  final String fullName;
  final String email;
  final String imageUrl;
  final Campus? campus;
  final Cursus? cursus;
  final List<Project> projects;
  final List<Skill> skills;
  final double level;

  User({
    required this.id,
    required this.login,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    this.campus,
    this.cursus,
    required this.projects,
    required this.skills,
    required this.level,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    var cursusUsers = json['cursus_users'] as List;
    var mainCursus = cursusUsers.firstWhere((cursus) => cursus['cursus']['kind'] == 'main', orElse: () => null);
    var skills = mainCursus != null ? (mainCursus['skills'] as List).map((skill) => Skill.fromJson(skill)).toList() : <Skill>[];

    return User(
      id: json['id'],
      login: json['login'],
      fullName: json['usual_full_name'],
      email: json['email'],
      imageUrl: json['image']['versions']['medium'],
      campus: (json['campus']?.isNotEmpty ?? false) ? Campus.fromJson(json['campus'][0]) : null,
      cursus: mainCursus != null ? Cursus.fromJson(mainCursus['cursus']) : null,
      projects: (json['projects_users'] as List).map((project) => Project.fromJson(project)).toList(),
      skills: skills,
      level: mainCursus != null ? (mainCursus['level'] ?? 0.0) : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'fullName': fullName,
      'email': email,
      'imageUrl': imageUrl,
      'campus': campus?.toJson(),
      'cursus': cursus?.toJson(),
      'projects': projects.map((project) => project.toJson()).toList(),
      'skills': skills.map((skill) => skill.toJson()).toList(),
      'level': level,
    };
  }
}