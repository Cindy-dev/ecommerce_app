part of 'cart_bloc.dart';

class CartInitial extends CartState {}

@immutable
class CartLoading extends CartState {}

@immutable
class CartItemAdded extends CartState {
  const CartItemAdded({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [shoe];
}

@immutable
class CartItemRemoved extends CartState {
  const CartItemRemoved({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [shoe];
}