import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/newsletter.dart'; // We'll create this model next

class NewsletterService {
  static const String baseUrl = "https://sf-springboot-backend.onrender.com/api/newsletter";

  /// 🔹 SUBSCRIBE to newsletter
  static Future<Newsletter> subscribe({
    required String name,
    required String email,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/subscribe"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "name": name,
        "email": email,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Newsletter.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to subscribe");
    }
  }

  /// 🔹 UNSUBSCRIBE from newsletter
  static Future<void> unsubscribe(String email) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/unsubscribe/$email"),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception(data['message'] ?? "Failed to unsubscribe");
    }
  }

  /// 🔹 GET all newsletters (Admin only)
  static Future<List<Newsletter>> getAll() async {
    // You would add Authorization header for admin
    final response = await http.get(
      Uri.parse(baseUrl),
      // headers: {"Authorization": "Bearer <ADMIN_TOKEN>"}
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List content = data['data'];
      return content.map((e) => Newsletter.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch newsletters");
    }
  }

  /// 🔹 DELETE newsletter by ID (Admin only)
  static Future<void> delete(String id) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/$id"),
      // headers: {"Authorization": "Bearer <ADMIN_TOKEN>"}
    );

    final data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception(data['message'] ?? "Failed to delete newsletter");
    }
  }
}