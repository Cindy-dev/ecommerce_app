import 'package:flutter/material.dart';
import '../../util/e_commerce_colors.dart';

class ECCartAddButton extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  const ECCartAddButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: EcommerceColors.green,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: EcommerceColors.gray)),
      child: Text(
        "Add to cart",
        style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
            color: const Color(0xffFFFFFF),
            fontSize: fontSize),
      ),
    );
  }
}
