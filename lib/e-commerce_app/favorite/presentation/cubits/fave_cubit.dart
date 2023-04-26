import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product.dart';
part 'fave_state.dart';

class FaveCubit extends Cubit<FaveState>{
FaveCubit():super(FaveInitial());


final List<Product> faveItems = [];
List<Product> get faveModels => faveItems;

void addFavoriteItem(Product product){

}


void addProductToFavorites(Product product) {
  List<Product> updatedProducts = List.from(state.products)..add(product);
  emit(FavoriteListState(updatedProducts));
}

}

