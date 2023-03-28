part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class FetchCartEvent extends CartEvent {}

class AddItemToCartEvent extends CartEvent {
  const AddItemToCartEvent({
    required this.product,
  });
  final Product product;
}

class RemoveItemFromCartEvent extends CartEvent {
  const RemoveItemFromCartEvent({
    required this.product,
  });
  final Product product;
}

class ResetCartBlocEvent extends CartEvent {}
