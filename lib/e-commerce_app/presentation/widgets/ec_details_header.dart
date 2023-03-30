import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_app_ui/e-commerce_app/util/navigators.dart';
import '../../util/e_commerce_colors.dart';
import '../views/e_commerce_cart_screen.dart';
import 'ec_cart_banner.dart';

class ECDetailsHeader extends StatelessWidget {
  final Product product;
  final CartBloc cartBloc;
  const ECDetailsHeader(
      {Key? key, required this.product, required this.cartBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0,
        right: 20,
        top: 50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            onPressed: () => navigatePop(context),
            icon: Icon(
              Icons.arrow_back,
              size: 29,
              color: EcommerceColors.black.withOpacity(0.7),
            ),
          ),
          const Text(
            "Details product",
            style: TextStyle(
              fontSize: 16,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: () => navigatePushIos(
                context,
                ECCartScreen(
                  product: product,
                  cartBloc: cartBloc,
                )),
            child: Stack(
              children: [
                Image.asset(
                  "assets/e_commerce_app/e_commerce_image/Buy.png",
                  scale: 4,
                ),
                const Positioned(right: 0, child: ECCartBanner()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
