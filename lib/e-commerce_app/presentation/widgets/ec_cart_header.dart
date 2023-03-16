import 'package:flutter/material.dart';
import '../../util/e_commerce_colors.dart';
import '../../util/navigators.dart';
import 'ec_cart_banner.dart';

class ECCartHeader extends StatelessWidget {
  const ECCartHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 20, top: 50, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
              const SizedBox(
                width: 20,
              ),
              const Text(
                "Your Cart",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
           Stack(
              children: [
                Image.asset(
                  "assets/e_commerce_app/e_commerce_image/Buy.png",
                  scale: 4,
                ),
                const Positioned(right: 0, child: ECCartBanner()),
              ],
            ),
        ],
      ),
    );
  }
}
