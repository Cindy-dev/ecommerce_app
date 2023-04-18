import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import '../../../util/e_commerce_colors.dart';
import 'ec_details_header.dart';

class ECDetailWidget extends StatelessWidget {
  final Product product;
  const ECDetailWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const ECDetailsHeader(),
        Container(
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            height: deviceH / 2.5,
            child: Hero(
              tag: product.image,
              child: Container(
                  width: deviceW,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage(
                          product.image,
                        )),
                  )),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: product.name,
                      child: Material(
                        child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
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
          ]),
        ),
      ],
    );
  }
}

class ECDetailWidget2 extends StatelessWidget {
  final Product product;
  const ECDetailWidget2({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              child: Image.asset(
                product.storeImage,
                fit: BoxFit.fitHeight,
                scale: 4,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.storeName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
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
        const Divider(),
        const Text(
          "Description of product",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          product.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
