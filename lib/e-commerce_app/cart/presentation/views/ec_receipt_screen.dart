import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/cart/presentation/cubits/cart_cubit.dart';
import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import 'package:flutter_app_ui/e-commerce_app/product/presentation/views/e_commerce_home_screen.dart';
import 'package:flutter_app_ui/e-commerce_app/util/dummy_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/e_commerce_colors.dart';
import '../../../util/navigators.dart';

class ECReceiptScreen extends StatelessWidget {
  const ECReceiptScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EcommerceColors.green,
        title: const Text("Order Receipt"),
      ),
      body: SafeArea(
          child: BlocBuilder(
              bloc: CartCubit(),
              builder: (context, state) {
                final items = context.read<CartCubit>().cartItems;
                return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      final prod = items[i];
                      return Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: height / 9,
                                          width: width / 4,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      items[i].image))),
                                        ),
                                        Positioned(
                                            right: 0,
                                            top: 0,
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      EcommerceColors.grayText),
                                              child: Text(
                                                prod.quantity.toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 10,
                                                    color:
                                                        EcommerceColors.white,
                                                    fontFamily: "Inter"),
                                              ),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            prod.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: prod
                                                        .selectedColor ==
                                                    ""
                                                ? Color(
                                                    int.parse(prod.color![0]))
                                                : Color(int.parse(
                                                    prod.selectedColor)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    " \$${(prod.price * prod.quantity).round()}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]);
                    });
              })),
      persistentFooterButtons: [
        GestureDetector(
          onTap: () {
            navigatePush(
              context,
              const ECommerceHomeScreen(),
            );
            DummyData.orderHistory = context.read<CartCubit>().cartItems;
          },
          child: Container(
            height: 45,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: EcommerceColors.green),
            child: const Text(
              "Go Back To Home",
              style: TextStyle(
                fontSize: 15,
                fontFamily: "Inter",
                color: EcommerceColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }
}
