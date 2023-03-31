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

  void incrementCartItem() {
    _updateCartItem(_cartItemCount + 1);
    print(_cartItemCount);
  }

  void decrementCartItem() {
    if (_cartItemCount < 0 || _cartItemCount == 0) return;
    _updateCartItem(_cartItemCount - 1);
  }
}
