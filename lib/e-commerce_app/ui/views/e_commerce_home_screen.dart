import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import '../../ui/widgets/ecommerce_home_screen_header.dart';

class ECommerceHomeScreen extends StatelessWidget {
  const ECommerceHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const EcommerceHomeScreenHeader(),
          Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: EcommerceColors.border1, width: 2),
            ),
            child: Row(children: [
              const SizedBox(width: 12),
              Image.asset("assets/e_commerce_app/e_commerce_image/Search.png",
                  scale: 4.5),
              const SizedBox(
                width: 13,
              ),
              const Text(
                "Search here ...",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    color: EcommerceColors.gray,
                    fontSize: 13),
              ),
            ]),
          ),
          const SizedBox(
            height: 17,
          ),
          Image.asset("assets/e_commerce_app/e_commerce_image/banner.png"),
        ],
      ),
    );
  }
}
