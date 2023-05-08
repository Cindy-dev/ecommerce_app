import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/e_commerce_colors.dart';
import '../cubits/cart_cubit.dart';

class ECCheckoutSummary extends StatelessWidget {
  const ECCheckoutSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(color: EcommerceColors.gray),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/e_commerce_app/e_commerce_image/Buy.png",
                scale: 4,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Show order summary",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: EcommerceColors.black,
                    fontFamily: "Inter"),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '\$${context.watch()<CartCubit>().totalAmount().toString()}',
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
