import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());
  int _cartItemCount = 0;
  final List<Product> cartItems = [];

  void _updateCartItem(int newCount) {
    emit(CartItemLoading());
    _cartItemCount = newCount;
    emit(
      CartItemUpdated(cartItemCount: _cartItemCount),
    );
  }

  //calculating the amount based on quantity
  int totalAmount() {
    var total = 0;
    double calculateTotal = 0;
    for (Product product in cartItems) {
      calculateTotal += product.price * _cartItemCount;
      total = calculateTotal.toInt();
      print(product.price);
      print(_cartItemCount);
    }
    print(total);
    return total;
  }

  void incrementCartItem() {
    _updateCartItem(_cartItemCount + 1);
  }

  void decrementCartItem() {
    if (_cartItemCount < 0 || _cartItemCount == 0) return;
    _updateCartItem(_cartItemCount - 1);
  }
}
