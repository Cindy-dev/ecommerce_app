import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/views/e_commerce_detail_screen.dart';
import 'package:flutter_app_ui/e-commerce_app/util/navigators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/providers/cart_provider.dart';
import '../../data/models/product.dart';
import '../../util/e_commerce_colors.dart';
import '../blocs/cart_bloc/cart_bloc.dart';

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
    final logger = Logger();
    return BlocListener<CartBloc, CartState>(
      bloc: CartBloc(),
      listener: (context, state) {
        // do stuff here based on Bloc's state
        if(state is CartItemAdded) {
          navigatePush(context, ECDetailScreen(product: product));
          print("Item has been added to cart please");
          logger.wtf("Item has been added to cart please");
        }
      },
      child: GestureDetector(
        onTap: () {
          context.read<CartBloc>().add(AddItemToCartEvent(product: product));
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
