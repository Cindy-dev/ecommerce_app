import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/widgets/ecommerce_category_widget.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import '../../ui/widgets/ecommerce_home_screen_header.dart';

class ECommerceHomeScreen extends StatelessWidget {
  const ECommerceHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const EcommerceHomeScreenHeader(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.only(left: 12),
            alignment: Alignment.center,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: EcommerceColors.border1, width: 2),
            ),
            child: Row(children: [
              Image.asset("assets/e_commerce_app/e_commerce_image/Search.png",
                  scale: 4.5),
              const SizedBox(
                width: 13,
              ),
              const Text(
                "Search here ...",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    color: EcommerceColors.gray,
                    fontSize: 13),
              ),
            ]),
          ),
          const SizedBox(
            height: 17,
          ),
          Image.asset("assets/e_commerce_app/e_commerce_image/banner.png"),
          const EcommerceCategoryWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent product",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      color: EcommerceColors.black,
                      fontSize: 14),
                ),
                Row(
                  children: [
                    const Text(
                      "Filters",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          color: EcommerceColors.black,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                        "assets/e_commerce_app/e_commerce_image/Filter.png",
                        scale: 4),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Container(
              //height: 217,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: EcommerceColors.gray)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/e_commerce_app/e_commerce_image/television.png",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Monitor LG 22”inc 4K 120Fps",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              color: EcommerceColors.black,
                              fontSize: 12),
                        ),
                       const SizedBox(height: 4,),
                        const Text(
                          "\$199.99",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              color: EcommerceColors.black,
                              fontSize: 14),
                        ),
                        const SizedBox(height: 11),
                        Container(
                          

                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
