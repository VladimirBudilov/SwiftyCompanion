class Campus {
  final int id;
  final String name;
  final String address;
  final String city;
  final String website;

  Campus({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.website,
  });

  factory Campus.fromJson(Map<String, dynamic> json) {
    return Campus(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      website: json['website'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'website': website,
    };
  }
}
