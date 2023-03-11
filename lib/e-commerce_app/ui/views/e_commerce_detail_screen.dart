import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/widgets/ec_home_widget/ec_details_header.dart';

import '../../util/e_commerce_colors.dart';

class ECDetailScreen extends StatelessWidget {
  const ECDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ECDetailsHeader(),
          SizedBox(
            height: deviceH / 2.5,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      width: 390,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/e_commerce_app/e_commerce_image/imgslider.png",
                        )),
                      )),
                  Container(
                      width: 390,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/e_commerce_app/e_commerce_image/max1.png",
                        )),
                      )),
                  Container(
                      width: 390,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/e_commerce_app/e_commerce_image/max2.png",
                        )),
                      )),
                  Container(
                      width: 390,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/e_commerce_app/e_commerce_image/max3.png",
                        )),
                      )),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Air pods max by Apple",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: const [
                            Text(
                              "\$ 1999,99",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "( 219 people buy this )",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: EcommerceColors.gray.withOpacity(0.7),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                        color: EcommerceColors.grayText,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Choose the color",
                  style: TextStyle(
                    fontSize: 14,
                    color: EcommerceColors.grayText,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(children: [
                  Container(
                    height: 41,
                    width: 61,
                    margin: const EdgeInsets.only(top: 9, bottom: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange),
                  ),
                ]),
                const Divider(),
                Row(
                  children: [
                    Image.asset(
                      "assets/e_commerce_app/e_commerce_image/apple.png",
                      scale: 4,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Apple Store",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "online 12 mins ago",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Inter",
                            color: EcommerceColors.grayText,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 37,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 4,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 5.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: EcommerceColors.gray)),
                      child: const Text(
                        "Follow",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                const Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
