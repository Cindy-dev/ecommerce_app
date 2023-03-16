import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/util/navigators.dart';
import '../../util/e_commerce_colors.dart';
import '../views/e_commerce_detail_screen.dart';

class ECItemCard extends StatelessWidget {
  const ECItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: EcommerceColors.gray)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => navigatePush(context, const ECDetailScreen()),
              child: Image.asset(
                "assets/e_commerce_app/e_commerce_image/television.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
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
                        border: Border.all(color: EcommerceColors.gray)),
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
      )),
    );
  }
}
