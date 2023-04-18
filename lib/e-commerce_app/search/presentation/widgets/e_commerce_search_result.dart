import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import 'package:flutter_app_ui/e-commerce_app/product/presentation/views/e_commerce_detail_screen.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import 'package:flutter_app_ui/e-commerce_app/util/navigators.dart';
import '../../../cart/presentation/widgets/ec_cart_add_button.dart';

class ECSearchResult extends StatefulWidget {
  final Product prod;
  final String searchWord;
  const ECSearchResult({Key? key, required this.searchWord, required this.prod})
      : super(key: key);

  @override
  State<ECSearchResult> createState() => _ECSearchResultState();
}

class _ECSearchResultState extends State<ECSearchResult> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 23,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: EcommerceColors.gray)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () =>
                    navigatePush(context, ECDetailScreen(product: widget.prod)),
                child: Hero(
                  tag: widget.prod.image,
                  child: Container(
                    height: height / 6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.prod.image))),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.prod.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          color: EcommerceColors.black,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "\$${widget.prod.price}",
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          color: EcommerceColors.black,
                          fontSize: 14),
                    ),
                    const SizedBox(height: 11),
                    FittedBox(
                        fit: BoxFit.cover,
                        child: ECCartAddButton(
                          color: "",
                          product: widget.prod,
                          fontSize: 20,
                          width: width / 2,
                          height: height / 15,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
