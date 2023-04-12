import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../../data/models/product.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Logger logger = Logger();
  CartCubit() : super(CartInitial());

  final List<Product> cartItems = [];
  List<Product> get cartModels => cartItems;

  void addItemToCart(Product product) {
    if (cartItems.contains(product)) {
      return;
    }
    cartItems.add(product);
    emit(CartItemAdded(product: product));
  }

  void incrementCartItem(Product cart) {
    cart.increment();

    emit(CartItemUpdated(product: cart));
  }

  void decrementCartItem(Product cart) {
    cart.decrement();
    emit(CartItemUpdated(product: cart));
  }

  //calculating the amount based on quantity
  int totalAmount() {
    var total = 0;
    double calculateTotal = 0;
    for (Product product in cartItems) {
      calculateTotal += product.price * product.quantity;
      total = calculateTotal.toInt();
    }
    return total;
  }

  void removeItemFromCart(Product product) {
    cartItems.remove(product);
    emit(CartItemRemoved(product: product));

    return;
  }
}
