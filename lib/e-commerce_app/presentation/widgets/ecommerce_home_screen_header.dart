import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/widgets/check.dart';
import '../../util/e_commerce_colors.dart';
import '../../util/navigators.dart';
import '../views/e_commerce_cart_screen.dart';
import 'ec_cart_banner.dart';

class EcommerceHomeScreenHeader extends StatelessWidget {
  const EcommerceHomeScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.only(top: deviceH / 15, bottom: 16, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Delivery address",
            style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: EcommerceColors.gray),
          ),
          const SizedBox(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Lagos Nigeria",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    color: EcommerceColors.black,
                    fontSize: 14),
              ),
              Row(
                children: [
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
                  const SizedBox(
                    width: 13,
                  ),
                  Image.asset(
                      "assets/e_commerce_app/e_commerce_image/Notification.png",
                      scale: 4.5),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
