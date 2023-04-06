import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';

class CartModel {
  final Product product;
  int quantity;

  CartModel({required this.product, required this.quantity});
}