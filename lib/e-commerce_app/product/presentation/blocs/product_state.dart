part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

@immutable
class ProductInitial extends ProductState {}

@immutable
class ProductStateLoading extends ProductState {}

@immutable
class ProductStateLoaded extends ProductState {
  final List<Product> products;
  ProductStateLoaded({
    required this.products,
  });
}

@immutable
class ProductStateError extends ProductState {
  final String errorMessage;

  ProductStateError({required this.errorMessage});
}
