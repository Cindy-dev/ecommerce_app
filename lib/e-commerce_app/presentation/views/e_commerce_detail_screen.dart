import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_button.dart';
import '../../util/e_commerce_colors.dart';
import '../blocs/cart_bloc/cart_bloc.dart';
import '../widgets/ec_cart_add_button.dart';
import '../widgets/ec_details_header.dart';

class ECDetailScreen extends StatelessWidget {
  final CartBloc cartBloc;

  final Product product;
  const ECDetailScreen({
    Key? key,
    required this.product,
    required this.cartBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ECDetailsHeader(
              product: product,
              cartBloc: cartBloc,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 5),
              height: deviceH / 2.5,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Hero(
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
                    ),
                    Container(
                        width: deviceW,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(
                                "assets/e_commerce_app/e_commerce_image/max1.png",
                              )),
                        )),
                    Container(
                        width: deviceW,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage(
                                "assets/e_commerce_app/e_commerce_image/max2.png",
                              )),
                        )),
                    Container(
                        width: deviceW,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
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
                  children: [
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
                          backgroundColor:
                              EcommerceColors.gray.withOpacity(0.7),
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      SizedBox(
                        height: deviceH / 12,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: product.color?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 41,
                                width: deviceW / 4,
                                margin: const EdgeInsets.only(
                                    top: 9, bottom: 10, right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(
                                        int.parse(product.color![index]))),
                              );
                            }),
                      ),
                      const Divider(),
                      Row(
                        children: [
                          SizedBox(
                            height: deviceH / 15,
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
                                border:
                                    Border.all(color: EcommerceColors.gray)),
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
                  ),
                ),
              ),
            ),
          ]),
      persistentFooterButtons: [
        Padding(
          padding:
              const EdgeInsets.only(top: 14, bottom: 15, left: 21, right: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ECCartAddButton(
                height: 45,
                width: deviceH / 5.4,
                fontSize: 12,
                product: product,
                cartBloc: cartBloc,
              ),
              const SizedBox(
                width: 15,
              ),
              const ECButton(
                  buttonColor: EcommerceColors.white,
                  buttonText: "Buy Now",
                  textColor: EcommerceColors.black,
                  borderColor: EcommerceColors.gray)
            ],
          ),
        ),
      ],
    );
    //});
  }
}
