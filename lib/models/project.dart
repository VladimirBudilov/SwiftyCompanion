class Project {
  final int id;
  final String name;
  final String slug;
  final int finalMark;
  final bool validated;
  final String status;

  Project({
    required this.id,
    required this.name,
    required this.slug,
    required this.finalMark,
    required this.validated,
    required this.status,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['project']['id'],
      name: json['project']['name'],
      slug: json['project']['slug'],
      finalMark: json['final_mark'] ?? 0,
      validated: json['validated?'] ?? false,
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'finalMark': finalMark,
      'validated': validated,
      'status': status,
    };
  }
}