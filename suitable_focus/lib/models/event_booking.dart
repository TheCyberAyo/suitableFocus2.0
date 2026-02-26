class EventBooking {
  final String id;
  final String eventName;
  final DateTime eventDate;
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final double amount;

  EventBooking({
    required this.id,
    required this.eventName,
    required this.eventDate,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.amount,
  });

  factory EventBooking.fromJson(Map<String, dynamic> json) {
    return EventBooking(
      id: json['id'],
      eventName: json['eventName'],
      eventDate: DateTime.parse(json['eventDate']),
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      amount: (json['amount'] as num).toDouble(),
    );
  }
}