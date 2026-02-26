import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_response.dart';

class AdminService {
  static const String baseUrl = "https://sf-springboot-backend.onrender.com/api/admin";

  /// 🔹 Get all users (admin only)
  static Future<List<UserResponse>> getAllUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List content = data['data'];
      return content.map((e) => UserResponse.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch users");
    }
  }

  /// 🔹 Promote user to admin
  static Future<void> promoteUser(String userId) async {
    final response = await http.post(Uri.parse("$baseUrl/users/$userId/promote"));

    if (response.statusCode != 200) {
      final data = jsonDecode(response.body);
      throw Exception(data['message'] ?? "Failed to promote user");
    }
  }
}