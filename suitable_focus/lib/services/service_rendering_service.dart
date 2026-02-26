import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import '../models/service_rendering.dart'; // We'll create this model next

class ServiceRenderingService {
  static const String baseUrl = "https://sf-springboot-backend.onrender.com/api/services";

  /// 🔹 CREATE service rendering
  static Future<ServiceRendering> create({
    required String serviceName,
    required String clientName,
    required String clientLastName,
    required String clientEmail,
    required String phoneContact,
    required double amount,
  }) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $idToken",
      },
      body: jsonEncode({
        "serviceName": serviceName,
        "clientName": clientName,
        "clientLastName": clientLastName,
        "clientEmail": clientEmail,
        "phoneContact": phoneContact,
        "amount": amount,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ServiceRendering.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to create service rendering");
    }
  }

  /// 🔹 GET my services (for logged in user)
  static Future<List<ServiceRendering>> getMyServices() async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.get(
      Uri.parse("$baseUrl/my"),
      headers: {
        "Authorization": "Bearer $idToken",
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List content = data['data'];
      return content.map((e) => ServiceRendering.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch services");
    }
  }

  /// 🔹 GET all services (Admin only)
  static Future<List<ServiceRendering>> getAll({int page = 0, int size = 10}) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.get(
      Uri.parse("$baseUrl?page=$page&size=$size"),
      headers: {
        "Authorization": "Bearer $idToken",
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List content = data['data']['content'];
      return content.map((e) => ServiceRendering.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch all services");
    }
  }

  /// 🔹 GET service by ID (Admin only)
  static Future<ServiceRendering> getById(String id) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.get(
      Uri.parse("$baseUrl/$id"),
      headers: {
        "Authorization": "Bearer $idToken",
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ServiceRendering.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to fetch service by ID");
    }
  }
}