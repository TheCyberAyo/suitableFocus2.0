import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // ✅ Render backend URL
  static const String baseUrl = "https://sf-springboot-backend.onrender.com/api/auth";

  /// REGISTER USER
  static Future<Map<String, dynamic>> registerUser({
    required String name,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {

    // Get Firebase ID token
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $idToken",
      },
      body: jsonEncode({
        "name": name,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "password": password,
      }),
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception(responseBody["message"] ?? "Registration failed");
    }
  }

  /// GET CURRENT USER PROFILE
  static Future<Map<String, dynamic>> getProfile() async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.get(
      Uri.parse("$baseUrl/me"),
      headers: {
        "Authorization": "Bearer $idToken",
      },
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception(responseBody["message"] ?? "Failed to fetch profile");
    }
  }

  /// UPDATE PROFILE
  static Future<Map<String, dynamic>> updateProfile({
    required String id,
    required String name,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.put(
      Uri.parse("$baseUrl/me/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $idToken",
      },
      body: jsonEncode({
        "name": name,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "password": password,
      }),
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseBody;
    } else {
      throw Exception(responseBody["message"] ?? "Update failed");
    }
  }
}