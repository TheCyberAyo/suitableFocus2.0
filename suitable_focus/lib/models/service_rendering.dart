class ServiceRendering {
  final String id;
  final String serviceName;
  final String clientName;
  final String clientLastName;
  final String clientEmail;
  final String phoneContact;
  final double amount;

  ServiceRendering({
    required this.id,
    required this.serviceName,
    required this.clientName,
    required this.clientLastName,
    required this.clientEmail,
    required this.phoneContact,
    required this.amount,
  });

  factory ServiceRendering.fromJson(Map<String, dynamic> json) {
    return ServiceRendering(
      id: json['id'],
      serviceName: json['serviceName'],
      clientName: json['clientName'],
      clientLastName: json['clientLastName'],
      clientEmail: json['clientEmail'],
      phoneContact: json['phoneContact'],
      amount: (json['amount'] as num).toDouble(),
    );
  }
}