import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product.dart';
import '../../util/e_commerce_colors.dart';
import '../cubits/cart_cubit/cart_cubit.dart';

class ECCartAddButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  final Product product; //the product to add or remove from cart
  final String color;
  const ECCartAddButton({
    Key? key,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.product,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataBloc = BlocProvider.of<CartCubit>(context);
    return BlocListener<CartCubit, CartState>(
      bloc: dataBloc,
      listener: (context, state) {
          if (state is CartItemAdded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                elevation: 0,
                duration: Duration(milliseconds: 300),

                content: Text("Product Added"),
              ),
            );
            ScaffoldMessengerState.removeCurrentSnackBar;
          }

        // do stuff here based on Bloc's state
      },
      child: GestureDetector(
        onTap: () {
          context.read<CartCubit>().addItemToCart(product, color);
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
