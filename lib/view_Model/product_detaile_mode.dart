import 'dart:convert';

import 'package:codeedex/model/product_detaile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetailViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _error;
  ProductDetaile? _productDetails;

  bool get isLoading => _isLoading;
  String? get error => _error;
  ProductDetaile? get productDetails => _productDetails;

  Future<void> fetchProductDetails(String productId) async {
    _isLoading = true;
    _error = null;
    _productDetails = null;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse('https://prethewram.pythonanywhere.com/api/parts_categories/$productId/'));
      
      if (response.statusCode == 200) {
        // Parsing the JSON response into ProductDetaile
        _productDetails = ProductDetaile.fromJson(json.decode(response.body));
      } else {
        _error = 'Failed to load product details';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
