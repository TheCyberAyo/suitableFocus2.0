import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/career_position.dart';
import '../models/career_application.dart';

class CareerService {
  static const String baseUrl = "https://sf-springboot-backend.onrender.com/api/careers";

  /// 🔹 GET all positions
  static Future<List<CareerPosition>> getAllPositions() async {
    final response = await http.get(Uri.parse(baseUrl));

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List content = data['data'];
      return content.map((e) => CareerPosition.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch positions");
    }
  }

  /// 🔹 GET a position by ID
  static Future<CareerPosition> getPosition(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CareerPosition.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to fetch position");
    }
  }

  /// 🔹 APPLY for a position
  static Future<CareerApplication> apply({
    required String positionId,
    required String applicantName,
    required String email,
    String? resumeUrl,
    String? portfolioUrl,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/$positionId/apply"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "applicantName": applicantName,
        "email": email,
        "resumeUrl": resumeUrl,
        "portfolioUrl": portfolioUrl,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CareerApplication.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to apply");
    }
  }

  /// 🔹 ADMIN: create position
  static Future<CareerPosition> createPosition({
    required String title,
    required String description,
    String? location,
    required String type,
  }) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "description": description,
        "location": location,
        "type": type,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CareerPosition.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to create position");
    }
  }

  /// 🔹 ADMIN: update position
  static Future<CareerPosition> updatePosition({
    required String id,
    required String title,
    required String description,
    String? location,
    required String type,
  }) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "description": description,
        "location": location,
        "type": type,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return CareerPosition.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to update position");
    }
  }

  /// 🔹 ADMIN: delete position
  static Future<void> deletePosition(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    if (response.statusCode != 200) {
      final data = jsonDecode(response.body);
      throw Exception(data['message'] ?? "Failed to delete position");
    }
  }

  /// 🔹 ADMIN: get all applications for a position
  static Future<List<CareerApplication>> getApplicationsForPosition(String positionId) async {
    final response = await http.get(Uri.parse("$baseUrl/$positionId/applications"));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List content = data['data'];
      return content.map((e) => CareerApplication.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch applications");
    }
  }

  /// 🔹 ADMIN: get all applications
  static Future<List<CareerApplication>> getAllApplications() async {
    final response = await http.get(Uri.parse("$baseUrl/applications/all"));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List content = data['data'];
      return content.map((e) => CareerApplication.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch applications");
    }
  }
}