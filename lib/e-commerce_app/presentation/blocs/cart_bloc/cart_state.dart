part of 'cart_bloc.dart';

abstract class CartState  {
  const CartState();

  // @override
  // List<Object?> get props => [];
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

  // @override
  // List<Object?> get props => [product];
}

@immutable
class CartItemUpdated extends CartState {
  const CartItemUpdated({
    required this.product,
  });

  final Product product;

  // @override
  // List<Object?> get props => [product];
}

@immutable
class CartItemRemoved extends CartState {
  const CartItemRemoved({
    required this.product,
  });

  final Product product;

  // @override
  // List<Object?> get props => [product];
}
