import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState>(){
CartBloc () : super(CartInitial()){
on<AddItemToCartEvent>(_addItemToCart);
on<RemoveItemFromCartEvent>(_removeItemFromCart);
on<ResetCartBlocEvent>((event, emit) {
emit(CartInitial());
});
}
}