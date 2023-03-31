import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/widgets/image_marque.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import 'package:flutter_app_ui/e-commerce_app/util/navigators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/ecommerce_category_widget.dart';
import '../widgets/ecommerce_home_screen_header.dart';
import '../widgets/item_card.dart';
import 'e_commerce_search_page.dart';

class ECommerceHomeScreen extends StatefulWidget {
  const ECommerceHomeScreen({Key? key}) : super(key: key);

  @override
  State<ECommerceHomeScreen> createState() => _ECommerceHomeScreenState();
}

class _ECommerceHomeScreenState extends State<ECommerceHomeScreen> {
  final CartBloc myBloc = CartBloc();
  @override
  void initState() {
    //gives access to the bloc
    context.read<ProductBloc>().add(FetchProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EcommerceHomeScreenHeader(),
          GestureDetector(
            onTap: () => navigatePush(context, const ECSearchPage()),
            child: Container(
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
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            height: deviceH / 4,
            child: const ImageMarquee(),
          ),
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
          ECItemCard(
            cartBloc: myBloc,
          )
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: deviceH / 11,
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
