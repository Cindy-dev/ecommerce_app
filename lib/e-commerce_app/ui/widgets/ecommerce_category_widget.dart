import 'package:flutter/material.dart';

import '../../util/e_commerce_colors.dart';

class EcommerceCategoryWidget extends StatelessWidget {
  const EcommerceCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
          const SizedBox(height: 7,),
          Row(children: [
            Column(children: [
              Image.asset("assets/e_commerce_app/e_commerce_image/clothes.png", scale: 3,),
              const SizedBox(height: 6),
              const Text(
                "Apparel",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    color: EcommerceColors.black,
                    fontSize: 12),
              ),
            ],)
          ],)
        ],
      ),
    );
  }
}
