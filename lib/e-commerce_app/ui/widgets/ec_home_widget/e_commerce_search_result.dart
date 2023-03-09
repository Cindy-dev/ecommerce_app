import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/widgets/ec_home_widget/ec_search_header.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';

class ECSearchResult extends StatefulWidget {
  const ECSearchResult({Key? key}) : super(key: key);

  @override
  State<ECSearchResult> createState() => _ECSearchResultState();
}

class _ECSearchResultState extends State<ECSearchResult> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ECSearchHeader(),
          const SizedBox(height: 14),
          const Divider(
            color: EcommerceColors.gray,
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Search result for “Earphone”",
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
              ),
            ],
          ),
          const SizedBox(
            height: 23,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                     // margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: EcommerceColors.gray)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/e_commerce_app/e_commerce_image/imgslider.png",
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Earphones for monitor",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w400,
                                      color: EcommerceColors.black,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
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
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: EcommerceColors.green,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: EcommerceColors.gray)),
                                  child: const Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFFFFFF),
                                        fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      //margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: EcommerceColors.gray)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/e_commerce_app/e_commerce_image/imgslider.png",
                            fit: BoxFit.contain,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Earphones for monitor",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w400,
                                      color: EcommerceColors.black,
                                      fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
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
                                  alignment: Alignment.center,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: EcommerceColors.green,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: EcommerceColors.gray)),
                                  child: const Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffFFFFFF),
                                        fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
