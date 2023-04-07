import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());
  int _cartItemCount = 0;

  final List<Product> cartItems = [];
  List<Product> get cartModels => cartItems;

  void _updateCartItem(int newCount) {
    emit(CartItemLoading());
    _cartItemCount = newCount;
    emit(
      CartItemUpdated(cartItemCount: _cartItemCount),
    );
  }

  void addItemToCart(Product product) {
    if (cartItems.contains(product)) {
      return;
    }
    cartItems.add(product);
  }

  void incrementCartItem(Product cart) {
    Product cartModel =
        cartModels.firstWhere((element) => element.id == cart.id);
    //in a list of cartItems lets add the id found as the index and increase the quantity

    cartModels[cartModels.indexOf(cartModel)].quantity++;
   // _updateCartItem(_cartItemCount + 1);
  }

  void decrementCartItem() {
    if (_cartItemCount < 0 || _cartItemCount == 0) return;
    _updateCartItem(_cartItemCount - 1);
  }
}
