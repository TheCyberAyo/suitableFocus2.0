class UserResponse {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isAdmin;

  UserResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isAdmin,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      isAdmin: json['isAdmin'] ?? false,
    );
  }
}