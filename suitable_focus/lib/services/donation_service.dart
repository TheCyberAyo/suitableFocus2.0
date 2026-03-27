import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/donation_payment.dart'; // We'll create this next

class DonationService {
  static const String baseUrl = "https://sf-springboot-backend.onrender.com/api/donations";

  /// 🔹 MAKE a donation
  static Future<DonationPayment> donate({
    required String donorFirstName,
    required String donorLastName,
    required String email,
    String? phone,
    required double amount,
    required String sponsoredEntity,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "donorFirstName": donorFirstName,
        "donorLastName": donorLastName,
        "email": email,
        "phone": phone,
        "amount": amount,
        "sponsoredEntity": sponsoredEntity,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return DonationPayment.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Donation failed");
    }
  }

  /// 🔹 GET all donations (Admin only)
  static Future<List<DonationPayment>> getAll({int page = 0, int size = 10}) async {
    final response = await http.get(
      Uri.parse("$baseUrl?page=$page&size=$size"),
      // headers: {"Authorization": "Bearer <ADMIN_TOKEN>"}
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List content = data['data']['content'];
      return content.map((e) => DonationPayment.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch donations");
    }
  }

  /// 🔹 GET donation by ID (Admin only)
  static Future<DonationPayment> getById(String id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/$id"),
      // headers: {"Authorization": "Bearer <ADMIN_TOKEN>"}
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return DonationPayment.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to fetch donation by ID");
    }
  }
}