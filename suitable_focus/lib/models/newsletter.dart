class Newsletter {
  final String id;
  final String name;
  final String email;

  Newsletter({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Newsletter.fromJson(Map<String, dynamic> json) {
    return Newsletter(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}