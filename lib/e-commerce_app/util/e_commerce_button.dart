import 'package:flutter/material.dart';


class ECButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Color textColor;
  final Color borderColor;
  const ECButton(
      {Key? key,
      required this.buttonColor,
      required this.buttonText,
      required this.textColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: width / 5.4,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: borderColor)),
      child: Text(
        buttonText,
        style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
            color: textColor,
            fontSize: 12),
      ),
    );
  }
}
