class DonationPayment {
  final String id;
  final String donorFirstName;
  final String donorLastName;
  final String email;
  final String? phone;
  final double amount;
  final String sponsoredEntity;

  DonationPayment({
    required this.id,
    required this.donorFirstName,
    required this.donorLastName,
    required this.email,
    this.phone,
    required this.amount,
    required this.sponsoredEntity,
  });

  factory DonationPayment.fromJson(Map<String, dynamic> json) {
    return DonationPayment(
      id: json['id'],
      donorFirstName: json['donorFirstName'],
      donorLastName: json['donorLastName'],
      email: json['email'],
      phone: json['phone'],
      amount: (json['amount'] as num).toDouble(),
      sponsoredEntity: json['sponsoredEntity'],
    );
  }
}