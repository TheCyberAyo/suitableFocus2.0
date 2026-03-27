class CareerPosition {
  final String id;
  final String title;
  final String description;
  final String? location;
  final String type;

  CareerPosition({
    required this.id,
    required this.title,
    required this.description,
    this.location,
    required this.type,
  });

  factory CareerPosition.fromJson(Map<String, dynamic> json) {
    return CareerPosition(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      type: json['type'],
    );
  }
}