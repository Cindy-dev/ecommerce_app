import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import 'ec_search_header.dart';

class ECSearchResult extends StatefulWidget {
  final String searchWord;
  const ECSearchResult({Key? key, required this.searchWord}) : super(key: key);

  @override
  State<ECSearchResult> createState() => _ECSearchResultState();
}

class _ECSearchResultState extends State<ECSearchResult> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Search result for “${widget.searchWord}”",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      color: EcommerceColors.black,
                      fontSize: 14),
                ),
              ),
              const SizedBox(
                width: 10,
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
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: EcommerceColors.gray)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 6.5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "assets/e_commerce_app/e_commerce_image/imgslider.png",
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Earphones for monitor",
                              overflow: TextOverflow.ellipsis,
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
                                  border:
                                      Border.all(color: EcommerceColors.gray)),
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: EcommerceColors.gray)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 6.5,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "assets/e_commerce_app/e_commerce_image/earphone.png",
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Earphones for monitor",
                              overflow: TextOverflow.ellipsis,
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
                                  border:
                                      Border.all(color: EcommerceColors.gray)),
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
        ]);
  }
}
