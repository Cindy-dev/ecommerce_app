import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../../data/models/product.dart';
import '../../../util/e_commerce_colors.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Logger logger = Logger();
  CartCubit() : super(CartInitial());

  final List<Product> cartItems = [];
  List<Product> get cartModels => cartItems;
  void addItemToCart(Product product, String addColor, BuildContext context) {
    ///checking if an existing item was found. If cartItemIndex is equal to -1, it means
    ///that no matching item was found, so we should add a new item to the cart.
    ///If cartItemIndex is not equal to -1, it means that an existing item was found, so
    ///we should update the quantity of that item instead of adding a new item.

    ///The reason we're checking for -1 is because the indexWhere method returns -1 if no matching item
    ///is found. If a matching item is found, the method returns the index of the matching item.

    final cartItemIndex = cartItems.indexWhere(
      (item) => item.id == product.id && item.selectedColor == addColor,
    );

    if (cartItemIndex != -1) {
      final existingCartItem = cartItems[cartItemIndex];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: EcommerceColors.green,
          content: Text('Quantity updated for ${existingCartItem.name}.'),
          duration: const Duration(seconds: 1),
        ),
      );
      emit(CartItemAdded(product: existingCartItem));
    } else {
      ///the copyWith method is used to create a copy of the Product object with the selectedColor
      ///and quantity properties set to the values passed in as arguments.
      final newCartItem = product.copyWith(
        selectedColor: addColor,
        quantity: 1,
      );

      ///The copy is then added to the cartItems list.
      ///This ensures that each item in the cart is a unique object with its own properties.
      cartItems.add(newCartItem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: EcommerceColors.green,
          content: Text('${newCartItem.name} added to cart.'),
          duration: const Duration(seconds: 1),
        ),
      );
      emit(CartItemAdded(product: newCartItem));
    }
  }

  //-- Increment item function --//
  void incrementCartItem(Product cart) {
    cart.increment();
    emit(CartItemUpdated(product: cart));
  }

  //-- decrement item function --//
  void decrementCartItem(Product cart) {
    if (cart.quantity == 1) {
      cartItems.remove(cart);
    } else {
      cart.decrement();
    }

    emit(CartItemUpdated(product: cart));
  }

  //calculating the amount based on quantity
  int totalAmount() {
    var total = 0;
    double calculateTotal = 0;
    for (Product product in cartItems) {
      calculateTotal += product.price * product.quantity;
      total = calculateTotal.toInt();
    }
    return total;
  }

  //-- removing an item function --//
  void removeItemFromCart(Product product) {
    cartItems.remove(product);
    emit(CartItemRemoved(product: product));

    return;
  }
}
