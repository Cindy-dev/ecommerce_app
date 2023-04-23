import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';

class ECTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final double fontSize;
  final String? helperText;
  final FontWeight? fontWeight;
  final String? Function(String?)? validator;
  const ECTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    required this.fontSize,
    this.helperText,
    this.fontWeight,
    this.validator,
  }) : super(key: key);

  @override
  State<ECTextField> createState() => _ECTextFieldState();
}

class _ECTextFieldState extends State<ECTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: widget.validator,
        cursorHeight: 15,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        cursorColor: EcommerceColors.green,
        decoration: InputDecoration(
          helperText: widget.helperText,
          helperStyle: TextStyle(
              fontFamily: "Inter",
              color: EcommerceColors.grayText,
              fontSize: MediaQuery.of(context).size.width / 35,
              fontWeight: FontWeight.w400),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontFamily: "Inter",
              color: EcommerceColors.grayText,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: EcommerceColors.gray, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: EcommerceColors.gray, width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: EcommerceColors.gray, width: 2)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2)),
        ),
      ),
    );
  }
}
