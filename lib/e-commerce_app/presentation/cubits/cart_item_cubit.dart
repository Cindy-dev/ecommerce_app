import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  final Logger logger = Logger();
  CartItemCubit() : super(CartItemInitial());

final CartBloc cartBloc = CartBloc();
  List<Product> get cartModels => cartBloc.cartItems;

  void _updateCartItem() {
    emit(CartItemLoading());
   // emit(
      //CartItemUpdated(),
   // );
  }

  void addItemToCart(Product product) {
    if (cartBloc.cartItems.contains(product)) {
      return;
    }
    cartBloc.cartItems.add(product);
  }

  void incrementCartItem(Product cart) {
    logger.wtf(cartBloc.cartItems);
    Product cartModel =
        cartModels.firstWhere((element) => element.id == cart.id);
    //in a list of cartItems lets add the id found as the index and increase the quantity
    cartModels[cartModels.indexOf(cartModel)].quantity++;
    logger.wtf(cartModels[cartModels.indexOf(cartModel)].quantity);
    _updateCartItem();
  }

  void decrementCartItem() {
    //if (_cartItemCount < 0 || _cartItemCount == 0) return;
   // _updateCartItem(_cartItemCount - 1);
  }
}
