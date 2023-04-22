import 'package:flutter/material.dart';

class HistoryRow extends StatelessWidget {
  final String tag;
  final String content;
  const HistoryRow({Key? key, required this.tag, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
      Text(
        tag,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              fontFamily: "Inter"),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
         content,
          style:  const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              fontFamily: "Inter"),
        ),
      ],
    );
  }
}
