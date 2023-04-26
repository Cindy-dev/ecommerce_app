part of 'fave_cubit.dart';

abstract class FaveState {}

class FaveInitial extends FaveState {}

@immutable
class FaveLoading extends FaveState {}

@immutable
class FaveAdded extends FaveState {
  final Product product;

  FaveAdded({required this.product});
}

@immutable
class FaveRemoved extends FaveState {
  final Product product;

  FaveRemoved({required this.product});
}
