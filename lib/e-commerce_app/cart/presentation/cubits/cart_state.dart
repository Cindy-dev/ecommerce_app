part of 'cart_cubit.dart';

abstract class CartState  {
  const CartState();
}

class CartInitial extends CartState {}

@immutable
class CartLoading extends CartState {}

@immutable
class CartItemAdded extends CartState {
  const CartItemAdded({
    required this.product,
  });

  final Product product;
}

@immutable
class CartItemUpdated extends CartState {
  const CartItemUpdated({
    required this.product,
  });

  final Product product;
}

@immutable
class CartItemRemoved extends CartState {
  const CartItemRemoved({
    required this.product,
  });

  final Product product;
}
