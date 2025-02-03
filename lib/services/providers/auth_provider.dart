import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://prethewram.pythonanywhere.com/api/login/");
    final response = await http.post(
      url,
      body: jsonEncode({"email": email, "password": password}),
      headers: {"Content-Type": "application/json"},
    );

    _isLoading = false;
    notifyListeners();

    if (response.statusCode == 200) {
      return true; 
      
    } else {
      return false; 
    }
  }
}
