import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product.dart';
part 'fave_state.dart';

class FaveCubit extends Cubit<FaveState> {
  FaveCubit() : super(FaveInitial());

  final List<Product> faveItems = [];
  List<Product> get faveModels => faveItems;

  void addFavoriteItem(Product product) {
    // Check if the product already exists in the favorite list
    bool exists = faveItems.any((item) => item.id == product.id);

    if (!exists) {
      // If the product doesn't exist, add it to the list
      faveItems.add(product);
      emit(FaveAdded(product: product));
    } else {
      // If the product already exists, do nothing
      emit(FaveAdded(product: product));
    }
  }

  void toggleFavoriteItem(Product product) {
    bool exists = faveItems.any((item) => item.id == product.id);

    if (!exists) {
      faveItems.add(product);
      emit(FaveAdded(product: product));
    } else {
      faveItems.removeWhere((item) => item.id == product.id);
      emit(FaveRemoved(product: product));
    }
  }
}
