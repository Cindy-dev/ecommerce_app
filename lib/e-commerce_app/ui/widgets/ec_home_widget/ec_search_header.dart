import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';

class ECSearchHeader extends StatelessWidget {
  const ECSearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            size: 29,
            color: EcommerceColors.black,
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: TextFormField(
              cursorColor: EcommerceColors.gray,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: EcommerceColors.gray),
                      borderRadius: BorderRadius.circular(8)),
                  prefixIcon: Image.asset(
                    "assets/e_commerce_app/e_commerce_image/Search.png",
                    scale: 3,
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: EcommerceColors.gray),
                      borderRadius: BorderRadius.circular(8)))),
        ),
        const SizedBox(
          width: 11,
        ),
        Image.asset(
          "assets/e_commerce_app/e_commerce_image/Buy.png",
          scale: 4,
        ),
      ],
    );
  }
}
