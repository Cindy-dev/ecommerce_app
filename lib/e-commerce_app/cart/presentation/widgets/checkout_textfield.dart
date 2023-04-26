import 'package:flutter/material.dart';
import '../../../util/e_commerce_colors.dart';

class CheckoutTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const CheckoutTextField(
      {Key? key, required this.label, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        cursorColor: EcommerceColors.grayText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: EcommerceColors.gray),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: EcommerceColors.grayText),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: EcommerceColors.grayText),
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: const TextStyle(
            fontSize: 15,
            fontFamily: "Inter",
            color: EcommerceColors.black,
          ),
        ),
      ),
    );
  }
}
