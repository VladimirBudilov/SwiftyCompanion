class User {
  final String login;
  final String email;
  final String mobile;
  final String level;

  User({
    required this.login,
    required this.email,
    required this.mobile,
    required this.level,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      login: json['login'],
      email: json['email'],
      mobile: json['mobile'],
      level: json['level'],
    );
  }
}
