part of 'fave_cubit.dart';

abstract class FaveState {}

class FaveInitial extends FaveState {}

@immutable
class FaveLoading extends FaveState {}

@immutable
class FaveAdded extends FaveState {
  // final Product product;
  final List<Product> products;

  FaveAdded({required this.products});
}
