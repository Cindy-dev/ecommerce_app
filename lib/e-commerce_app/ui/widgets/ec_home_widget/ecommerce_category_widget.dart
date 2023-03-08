import 'package:flutter/material.dart';

import '../../../util/e_commerce_colors.dart';

class EcommerceCategoryWidget extends StatelessWidget {
  const EcommerceCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,6,20,17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Category",
            style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                color: EcommerceColors.black,
                fontSize: 15),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              catTile("assets/e_commerce_app/e_commerce_image/clothes.png",
                  "Apparel"),
              catTile("assets/e_commerce_app/e_commerce_image/stationery.png",
                  "School"),
              catTile("assets/e_commerce_app/e_commerce_image/stationery.png",
                  "Sports"),
              catTile("assets/e_commerce_app/e_commerce_image/kitchen.png",
                  "Electronic"),
              catTile("assets/e_commerce_app/e_commerce_image/nav.png", "All")
            ],
          )
        ],
      ),
    );
  }

  //horizontal tile of different categories in the app
  Widget catTile(String image, String title) {
    return Column(
      children: [
        Image.asset(
          image,
          scale: 3,
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: EcommerceColors.grayText,
              fontSize: 12),
        ),
      ],
    );
  }
}
