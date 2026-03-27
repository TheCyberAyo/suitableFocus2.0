import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/contact_message.dart'; // We'll create this next

class ContactService {
  static const String baseUrl = "https://sf-springboot-backend.onrender.com/api/contact";

  /// 🔹 Submit a contact message
  static Future<ContactMessage> submit({
    required String firstName,
    required String lastName,
    required String email,
    String? phone,
    required String message,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "message": message,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ContactMessage.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to submit message");
    }
  }

  /// 🔹 GET all messages (Admin only)
  static Future<List<ContactMessage>> getAll({int page = 0, int size = 10}) async {
    final response = await http.get(
      Uri.parse("$baseUrl?page=$page&size=$size"),
      // headers: {"Authorization": "Bearer <ADMIN_TOKEN>"}
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List content = data['data']['content'];
      return content.map((e) => ContactMessage.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch messages");
    }
  }

  /// 🔹 GET message by ID (Admin only)
  static Future<ContactMessage> getById(String id) async {
    final response = await http.get(
      Uri.parse("$baseUrl/$id"),
      // headers: {"Authorization": "Bearer <ADMIN_TOKEN>"}
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ContactMessage.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to fetch message by ID");
    }
  }

  /// 🔹 DELETE message (Admin only)
  static Future<void> delete(String id) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/$id"),
      // headers: {"Authorization": "Bearer <ADMIN_TOKEN>"}
    );

    if (response.statusCode != 200) {
      final data = jsonDecode(response.body);
      throw Exception(data['message'] ?? "Failed to delete message");
    }
  }
}