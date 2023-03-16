import 'package:flutter/material.dart';
import '../../util/e_commerce_colors.dart';
import '../widgets/ec_search_header.dart';

class ECSearchPage extends StatelessWidget {
  const ECSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: height / 16, left: 0, right: 20),
      child: Column(
        children: [
          const ECSearchHeader(),
          const SizedBox(height: 14),
          const Divider(
            color: EcommerceColors.gray,
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Last search",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      color: EcommerceColors.black,
                      fontSize: 16),
                ),
                Text(
                  "Clear all",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      color: EcommerceColors.red,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.access_time,
                      color: EcommerceColors.gray,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Iphone 12 pro max",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          color: EcommerceColors.black,
                          fontSize: 14),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                      color: EcommerceColors.gray,
                    ))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
