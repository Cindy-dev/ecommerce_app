import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _currentCartItems = [];
  List<Product> get currentCartItems => _currentCartItems;

  void updateCartItems(List<Product> items) {
    _currentCartItems = [...items];
    notifyListeners();
  }
}
