import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {});
    on<FetchProductEvent>(_fetchProductsFromJson);
  }

  Future<void> _fetchProductsFromJson(
    ProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductStateLoading());
    try {
      //retrieving our stored json product data
      final jsonData =
          await rootBundle.loadString("assets/e_commerce_jsons/products.json");

      await Future<dynamic>.delayed(const Duration(seconds: 1));
      final data = (json.decode(jsonData) as Map)['product'] as List;
      final listOfProducts = data
          .map(
            (value) => Product.fromMap(value as Map<String, dynamic>),
          )
          .toList();
      emit(
        ProductStateLoaded(
          product: listOfProducts,
        ),
      );
    } catch (e) {
      print(e.toString());
      emit(
        ProductStateError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
