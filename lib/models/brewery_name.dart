class BreweryName {
  final String id;
  final String name;

  BreweryName({required this.id, required this.name});

  factory BreweryName.fromJson(Map<String, dynamic> json) {
    return BreweryName(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
