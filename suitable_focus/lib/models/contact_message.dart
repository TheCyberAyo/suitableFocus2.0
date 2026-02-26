class ContactMessage {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String message;

  ContactMessage({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.message,
  });

  factory ContactMessage.fromJson(Map<String, dynamic> json) {
    return ContactMessage(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      message: json['message'],
    );
  }
}