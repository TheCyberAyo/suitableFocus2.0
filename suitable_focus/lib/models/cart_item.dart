class CartItem {
  final String id;
  final String name;
  final String? venue; // Optional for services
  final String? time; // Optional for services
  final String amount;
  final String? imagePath;
  final int quantity;
  final String? serviceType; // 'online' or 'one-on-one' for services
  final String itemType; // 'event' or 'service'

  CartItem({
    required this.id,
    required this.name,
    this.venue,
    this.time,
    required this.amount,
    this.imagePath,
    this.quantity = 1,
    this.serviceType,
    this.itemType = 'event',
  });

  CartItem copyWith({
    String? id,
    String? name,
    String? venue,
    String? time,
    String? amount,
    String? imagePath,
    int? quantity,
    String? serviceType,
    String? itemType,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      venue: venue ?? this.venue,
      time: time ?? this.time,
      amount: amount ?? this.amount,
      imagePath: imagePath ?? this.imagePath,
      quantity: quantity ?? this.quantity,
      serviceType: serviceType ?? this.serviceType,
      itemType: itemType ?? this.itemType,
    );
  }

  // Helper method to parse amount and calculate total
  double get totalAmount {
    // Remove currency symbols and parse
    final cleanAmount = amount.replaceAll(RegExp(r'[^\d.]'), '');
    if (cleanAmount.isEmpty || cleanAmount == 'Free') return 0.0;
    return double.tryParse(cleanAmount) ?? 0.0;
  }
}

