class Skill {
  final int id;
  final String name;
  final double level;

  Skill({
    required this.id,
    required this.name,
    required this.level,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      name: json['name'],
      level: json['level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
    };
  }
}