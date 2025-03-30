import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  String? _token;
  String? _userId;
  String? _name;
  String? _email;
  String? _role;
  bool _isLoading = false;

  bool get isAuthenticated => _token != null;
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get role => _role;
  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    try {
      final response = await _apiService.login(email, password);
      if (response['token'] != null) {
        _token = response['token'];
        _userId = response['userId'];
        
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        await prefs.setString('userId', _userId!);
        
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    try {
      _token = null;
      _userId = null;
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('userId');
      notifyListeners();
    } catch (e) {
      print('Logout error: $e');
      throw Exception('Failed to logout');
    }
  }

  Future<void> initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token');
      _userId = prefs.getString('userId');
      notifyListeners();
    } catch (e) {
      print('Initialization error: $e');
    }
  }
}