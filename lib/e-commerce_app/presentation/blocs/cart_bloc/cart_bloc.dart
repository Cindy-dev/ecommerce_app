import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../../data/models/product.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Logger logger = Logger();
  CartBloc() : super(CartInitial()) {
    on<AddItemToCartEvent>(_addItemToCart);
    on<RemoveItemFromCartEvent>(_removeItemFromCart);
    on<ResetCartBlocEvent>((event, emit) {
      emit(CartInitial());
    });
  }
  final List<Product> cartItems = [];
  List<Product> get cartModels => cartItems;

  void _addItemToCart(AddItemToCartEvent event, Emitter<CartState> emit) {
    if (cartItems.contains(event.product)) {
      return;
    }
    emit(CartLoading());
    cartItems.add(event.product);
    emit(CartItemAdded(product: event.product));
  }


  void incrementCartItem(Product cart) {
    Product cartModel =
        cartModels.firstWhere((element) => element.id == cart.id);
    //in a list of cartItems lets add the id found as the index and increase the quantity
    cartModels[cartModels.indexOf(cartModel)].quantity++;
    logger.wtf(cartModels[cartModels.indexOf(cartModel)].quantity);
    emit(CartItemAdded(product: cart));
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

  void _removeItemFromCart(
      RemoveItemFromCartEvent event, Emitter<CartState> emit) {
    emit(CartLoading());
    cartItems.remove(event.product);
    emit(CartItemRemoved(product: event.product));

    return;
  }
}
