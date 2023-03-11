import 'package:flutter/material.dart';

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
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    size: 29,
                    color: EcommerceColors.black.withOpacity(0.7),
                  ),
                ),
                const Text(
                  "Details product",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset(
                  "assets/e_commerce_app/e_commerce_image/Buy.png",
                  scale: 4,
                ),
              ],
            ),
          ),
          Container(
            height: deviceH /2.5,
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
          //  Container(
          //    height: deviceH/2.5,
          //     child: ListView(
          //         shrinkWrap: true,
          //         scrollDirection: Axis.horizontal,
          //         children: [
          //           Image.asset(
          //             "assets/e_commerce_app/e_commerce_image/imgslider.png"
          //             ,
          //             fit: BoxFit.cover,
          //           ),
          //           Image.asset(
          //             "assets/e_commerce_app/e_commerce_image/max1.png",
          //
          //           ),
          //           Image.asset(
          //             "assets/e_commerce_app/e_commerce_image/max2.png",
          //             width: 390,
          //           ),
          //           Image.asset(
          //             "assets/e_commerce_app/e_commerce_image/max3.png",
          //             width: 390,
          //           ),
          //         ]),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
            child: Column(
              children: const [
                Text(
                  "Air pods max by Apple",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
