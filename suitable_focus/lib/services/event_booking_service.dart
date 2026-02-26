import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import '../models/event_booking.dart'; // We'll create this next

class EventBookingService {
  static const String baseUrl = "https://sf-springboot-backend.onrender.com/api/events";

  /// 🔹 BOOK an event
  static Future<EventBooking> book({
    required String eventName,
    required DateTime eventDate,
    required String name,
    required String lastName,
    required String email,
    required String phone,
    required double amount,
  }) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.post(
      Uri.parse("$baseUrl/book"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $idToken",
      },
      body: jsonEncode({
        "eventName": eventName,
        "eventDate": eventDate.toIso8601String(),
        "name": name,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "amount": amount,
      }),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return EventBooking.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to book event");
    }
  }

  /// 🔹 GET my bookings (for logged-in user)
  static Future<List<EventBooking>> getMyBookings() async {
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
      return content.map((e) => EventBooking.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch my bookings");
    }
  }

  /// 🔹 GET all bookings (Admin only)
  static Future<List<EventBooking>> getAll({int page = 0, int size = 10}) async {
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
      return content.map((e) => EventBooking.fromJson(e)).toList();
    } else {
      throw Exception(data['message'] ?? "Failed to fetch all bookings");
    }
  }

  /// 🔹 GET booking by ID (Admin only)
  static Future<EventBooking> getById(String id) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final response = await http.get(
      Uri.parse("$baseUrl/$id"),
      headers: {
        "Authorization": "Bearer $idToken",
      },
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return EventBooking.fromJson(data['data']);
    } else {
      throw Exception(data['message'] ?? "Failed to fetch booking by ID");
    }
  }
}