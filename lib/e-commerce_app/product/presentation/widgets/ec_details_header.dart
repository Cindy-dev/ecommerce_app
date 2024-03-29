import 'package:flutter/material.dart';
import '../../../util/e_commerce_colors.dart';
import '../../../cart/presentation/views/e_commerce_cart_screen.dart';
import '../../../cart/presentation/widgets/ec_cart_banner.dart';
import '../../../util/navigators.dart';

class ECDetailsHeader extends StatelessWidget {
  const ECDetailsHeader({Key? key}) : super(key: key);

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
            onTap: () => navigatePushIos(context, const ECCartScreen()),
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
