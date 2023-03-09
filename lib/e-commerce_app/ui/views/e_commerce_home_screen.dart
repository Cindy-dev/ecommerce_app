import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/widgets/ec_home_widget/ecommerce_category_widget.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/widgets/ec_home_widget/item_card.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import '../widgets/ec_home_widget/ecommerce_home_screen_header.dart';

class ECommerceHomeScreen extends StatelessWidget {
  const ECommerceHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      fontWeight: FontWeight.w400,
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
          const ECItemCard()
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 102,
        width: double.infinity,
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: EcommerceColors.black,
              fontSize: 10),
          unselectedLabelStyle: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: EcommerceColors.black,
              fontSize: 10),
          selectedItemColor: EcommerceColors.green,
          unselectedItemColor: EcommerceColors.grayText,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Icon(Icons.text_snippet_outlined), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_3_outlined), label: "Account"),
          ],
        ),
      ),
    );
  }
}
