import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';

class ECCartBanner extends StatelessWidget {
  const ECCartBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.5,
      width: 11.5,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: EcommerceColors.red
      ),
      child: const Text("1", style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 7,
        color: EcommerceColors.white,
        fontFamily: "Inter"
      ),),
    );
  }
}
