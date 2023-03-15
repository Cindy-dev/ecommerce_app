import 'package:flutter/material.dart';

import '../../../util/e_commerce_colors.dart';

class ECDetailsHeader extends StatelessWidget {
  const ECDetailsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 20, right: 20, top: 50,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
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
          Image.asset(
            "assets/e_commerce_app/e_commerce_image/Buy.png",
            scale: 4,
          ),
        ],
      ),
    );
  }
}