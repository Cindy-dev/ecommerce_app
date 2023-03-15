import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import 'package:flutter_app_ui/e-commerce_app/util/navigators.dart';

class ECSearchHeader extends StatelessWidget {
  const ECSearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onPressed: () => navigatePop(context),
          icon: const Icon(
            Icons.arrow_back,
            size: 29,
            color: EcommerceColors.black,
          ),
        ),
        const SizedBox(width: 11),
        Flexible(
          flex: 3,
          child: TextFormField(
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: EcommerceColors.black,
                fontSize: 13,
              ),
              cursorColor: EcommerceColors.gray,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: EcommerceColors.gray),
                      borderRadius: BorderRadius.circular(8)),
                  prefixIcon: Image.asset(
                    "assets/e_commerce_app/e_commerce_image/Search.png",
                    scale: 4,
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
