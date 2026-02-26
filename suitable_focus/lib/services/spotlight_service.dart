import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

import '../models/spotlight.dart'; // We’ll create this model next

class SpotlightService {
  static const String baseUrl = "https://sf-springboot-backend.onrender.com/api/spotlights";

  // 🔹 GET all spotlights (paginated)
  static Future<List<Spotlight>> getAll({int page = 0, int size = 10}) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.get(
      Uri.parse("$baseUrl?page=$page&size=$size"),
      headers: {
        "Authorization": "Bearer $idToken",
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List content = data['data']['content']; // Spring returns Page object
      return content.map((e) => Spotlight.fromJson(e)).toList();
    } else {
      throw Exception(data["message"] ?? "Failed to fetch spotlights");
    }
  }

  // 🔹 GET spotlight by ID
  static Future<Spotlight> getById(String id) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.get(
      Uri.parse("$baseUrl/$id"),
      headers: {
        "Authorization": "Bearer $idToken",
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Spotlight.fromJson(data['data']);
    } else {
      throw Exception(data["message"] ?? "Failed to fetch spotlight");
    }
  }

  // 🔹 CREATE spotlight (Admin only)
  static Future<Spotlight> create({
    required String title,
    required String content,
    String? imageUrl,
    String? author,
  }) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $idToken",
      },
      body: jsonEncode({
        "title": title,
        "content": content,
        "imageUrl": imageUrl,
        "author": author,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Spotlight.fromJson(data['data']);
    } else {
      throw Exception(data["message"] ?? "Failed to create spotlight");
    }
  }

  // 🔹 UPDATE spotlight (Admin only)
  static Future<Spotlight> update({
    required String id,
    required String title,
    required String content,
    String? imageUrl,
    String? author,
  }) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $idToken",
      },
      body: jsonEncode({
        "title": title,
        "content": content,
        "imageUrl": imageUrl,
        "author": author,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Spotlight.fromJson(data['data']);
    } else {
      throw Exception(data["message"] ?? "Failed to update spotlight");
    }
  }

  // 🔹 DELETE spotlight (Admin only)
  static Future<void> delete(String id) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.delete(
      Uri.parse("$baseUrl/$id"),
      headers: {
        "Authorization": "Bearer $idToken",
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw Exception(data["message"] ?? "Failed to delete spotlight");
    }
  }
}