import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_ui/e-commerce_app/util/dummy_data.dart';
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
      final jsonData = await rootBundle
          .loadString('assets/e_commerce_app/e_commerce_jsons/products.json');

      await Future<dynamic>.delayed(const Duration(seconds: 1));
      final data = (json.decode(jsonData) as Map)['products'] as List;
      final listOfProducts = data
          .map(
            (value) => Product.fromMap(value as Map<String, dynamic>),
          )
          .toList();
      DummyData.productList = listOfProducts;
      emit(
        ProductStateLoaded(
          products: listOfProducts,
        ),
      );
    } catch (e) {
      emit(
        ProductStateError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
