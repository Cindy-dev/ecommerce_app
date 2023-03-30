import 'package:flutter/material.dart';
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
  final CartBloc cartBloc;
  const ECCartAddButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.product,
      required this.cartBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBloc = Provider.of<CartBloc>(context);

    return GestureDetector(
      onTap: () {
        cartBloc.add(AddItemToCartEvent(product: product));
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
    );
  }
}
