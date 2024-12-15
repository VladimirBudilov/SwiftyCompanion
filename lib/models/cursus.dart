class Cursus {
  final int id;
  final String name;
  final String slug;
  final String kind;
  final double level;

  Cursus({
    required this.id,
    required this.name,
    required this.slug,
    required this.kind,
    required this.level,
  });

  factory Cursus.fromJson(Map<String, dynamic> json) {
    return Cursus(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      kind: json['kind'],
      level: json['level'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'kind': kind,
      'level': level,
    };
  }
}