part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

@immutable
class ProductInitial extends ProductState {}

@immutable
class ProductStateLoading extends ProductState {}

@immutable
class ProductStateLoaded extends ProductState {
  final List<Product> product;
  ProductStateLoaded({
    required this.product,
  });
}

@immutable
class ProductStateError extends ProductState {
  final String errorMessage;

  ProductStateError({required this.errorMessage});
}
