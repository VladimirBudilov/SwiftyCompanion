import 'campus.dart';

class User {
  final int id;
  final String login;
  final String fullName;
  final String email;
  final String imageUrl;
  final String intraUrl;
  final Campus? campus;

  User({
    required this.id,
    required this.login,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    required this.intraUrl,
    this.campus,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      login: json['login'],
      fullName: json['usual_full_name'],
      email: json['email'],
      imageUrl: json['image']['versions']['medium'],
      intraUrl: json['url'],
      campus: (json['campus']?.isNotEmpty ?? false)
          ? Campus.fromJson(json['campus'][0])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'fullName': fullName,
      'email': email,
      'imageUrl': imageUrl,
      'intraUrl': intraUrl,
      'campus': campus?.toJson(),
    };
  }
}

