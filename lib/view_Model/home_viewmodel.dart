import 'dart:convert';

import 'package:codeedex/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeViewModel extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://prethewram.pythonanywhere.com/api/parts_categories/'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        _products = jsonData.map((item) => Product.fromJson(item)).toList();
      } else {
        _error = 'Failed to load products';
      }
    } catch (e) {
      _error = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
