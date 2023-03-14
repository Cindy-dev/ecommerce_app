import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'e_commerce_colors.dart';

class ECCartButton extends StatelessWidget {
  final IconData cartIcon;

  const ECCartButton(
      {Key? key,required this.cartIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      margin: const EdgeInsets.only(left: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: EcommerceColors.gray),
          color: EcommerceColors.white),
      child: Icon(
        cartIcon,
        color: EcommerceColors.gray,
        size: 17,
      ),
    );
  }
}
