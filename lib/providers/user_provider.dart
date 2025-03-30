import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  static const String baseUrl = 'https://api-7fy6reml3q-uc.a.run.app/api';
  String? _userId;
  String? _name;
  String? _email;
  String? _role;
  String? _token;
  String? _message;
  bool _isLoading = false;

  // Getters
  bool get isLoading => _isLoading;
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get role => _role;
  String? get token => _token;
  String? get message => _message;

  Future<bool> login(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        _message = responseData['message'];
        _token = responseData['token'];

        if (responseData.containsKey('user')) {
          final userData = responseData['user'];
          _userId = userData['userId']?.toString();
          _name = userData['name'];
          _email = userData['email'];
          _role = userData['role'];

          // Store in SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('userId', _userId ?? '');
          await prefs.setString('name', _name ?? '');
          await prefs.setString('email', _email ?? '');
          await prefs.setString('role', _role ?? '');
          await prefs.setString('token', _token ?? '');

          debugPrint('Login successful for user: ${userData['name']}');
          debugPrint('Role: ${userData['role']}');
        }

        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _isLoading = false;
        notifyListeners();

        // Format error message
        final errorMessage = '''
                Login Error:
                Status Code: ${response.statusCode}
                Message: ${responseData['message'] ?? 'No error message provided'}
                Response: ${response.body}
                ''';
        debugPrint(errorMessage);
        throw Exception(errorMessage);
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();

      // Format catch block error
      final errorMessage = '''
              Login Failed:
              Error Type: ${error.runtimeType}
              Details: $error
              ''';
      debugPrint(errorMessage);
      throw Exception(errorMessage);
    }
  }

  // Add method to check if user is logged in
  bool isLoggedIn() {
    return _token != null;
  }

  // Add method to load stored user data
  Future<void> loadStoredUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('userId');
    _name = prefs.getString('name');
    _email = prefs.getString('email');
    _role = prefs.getString('role');
    _token = prefs.getString('token');
    notifyListeners();
  }

  // Add logout method
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    _userId = null;
    _name = null;
    _email = null;
    _role = null;
    _token = null;
    _message = null;

    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required Map<String, String> address,
    String role = 'user',
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'address': {
            'street': address['street'] ?? '',
            'town': address['town'] ?? '',
            'pin': address['pin'] ?? '',
            'district': address['district'] ?? '',
            'state': address['state'] ?? '',
          },
          'role': role,
        }),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Store individual fields
        _message = responseData['message'];
        _token = responseData['token'];

        final userData = responseData['user'];
        _userId = userData['userId'];
        _name = userData['name'];
        _email = userData['email'];
        _role = userData['role'];

        // Store in SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', _userId ?? '');
        await prefs.setString('name', _name ?? '');
        await prefs.setString('email', _email ?? '');
        await prefs.setString('role', _role ?? '');
        await prefs.setString('token', _token ?? '');

        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _isLoading = false;
        notifyListeners();
        throw Exception('Failed to register: ${response.body}');
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Failed to register: $error');
    }
  }

  Future<Map<String, dynamic>> createReport({
    required String incidentType,
    required Map<String, double> location,
    required String description,
    required String severity,
    List<Map<String, String>>? mediaAttachments, required String timestamp,
  }) async {
    try {
      _isLoading = true;
      notifyListeners();

      if (_token == null) {
        throw Exception('User not authenticated');
      }

      final response = await http.post(
        Uri.parse('$baseUrl/reports'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: json.encode({
          'incidentType': incidentType,
          'location': {
            'latitude': location['latitude'],
            'longitude': location['longitude'],
            'accuracy': location['accuracy'],
            'timestamp': DateTime.now().toIso8601String(),
          },
          'mediaAttachments': mediaAttachments ?? [],
          'description': description,
          'severity': severity,
        }),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        return responseData;
      } else {
        _isLoading = false;
        notifyListeners();
        throw Exception('Failed to create report: ${response.body}');
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Failed to create report: $error');
    }
  }

}
