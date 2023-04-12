import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product.dart';
import '../../util/e_commerce_colors.dart';
import '../cubits/cart_cubit/cart_bloc.dart';

class ECCartAddButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Product product; //the product to add or remove from cart
  const ECCartAddButton({
    Key? key,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      bloc: CartCubit(),
      listener: (context, state) {
        // do stuff here based on Bloc's state
      },
      child: GestureDetector(
        onTap: () {
          context.read<CartCubit>().addItemToCart(product);
        },
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: EcommerceColors.green,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: EcommerceColors.gray)),
          child: Text(
            "Add to cart",
            style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: const Color(0xffFFFFFF),
                fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
