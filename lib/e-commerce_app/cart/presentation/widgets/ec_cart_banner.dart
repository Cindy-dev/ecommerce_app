import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../util/e_commerce_colors.dart';
import '../cubits/cart_cubit.dart';

class ECCartBanner extends StatelessWidget {
  const ECCartBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      final cart = context.watch<CartCubit>().cartItems.length.toString();
      return Container(
        height: 15.5,
        width: 15.5,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: EcommerceColors.red),
        child: Text(
          cart,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: EcommerceColors.white,
              fontFamily: "Inter"),
        ),
      );
    });
  }
}
