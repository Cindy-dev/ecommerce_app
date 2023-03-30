import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';

class ECCartBanner extends StatelessWidget {
  const ECCartBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartBloc>(context);
    final length = cart.cartItems.length.toString();
    return Container(
      height: 15.5,
      width: 15.5,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: EcommerceColors.red),
      child: Text(
        length,
        style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: EcommerceColors.white,
            fontFamily: "Inter"),
      ),
    );
  }
}
