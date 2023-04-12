import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_cart_button.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../cubits/cart_cubit/cart_bloc.dart';
import '../widgets/ec_cart_header.dart';

class ECCartScreen extends StatefulWidget {
  const ECCartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ECCartScreen> createState() => _ECCartScreenState();
}

class _ECCartScreenState extends State<ECCartScreen> {
  final Logger logger = Logger();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          const ECCartHeader(),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Delivery to",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Lagos Nigeria",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          BlocConsumer<CartCubit, CartState>(
              listener: (_, state) {},
              builder: (context, state) {
                final bloc = context.read<CartCubit>();
                final cartItems = bloc.cartItems;
                if (cartItems.isEmpty) {
                  const Expanded(
                    child: Center(child: Text("Your Cart is Empty")),
                  );
                }
                return Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: cartItems.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (bool? newValue) {},
                                  activeColor: EcommerceColors.green,
                                ),
                                Container(
                                  height: 76,
                                  width: 82,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                          image: AssetImage(cartItems[i].image),
                                          fit: BoxFit.fitHeight)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItems[i].name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Text(
                                      "Variant: Grey",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Inter",
                                        color: EcommerceColors.gray,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$${cartItems[i].price}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              9,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ECCartButton(
                                                onTap: () {
                                                  bloc.decrementCartItem(
                                                      cartItems[i]);
                                                },
                                                cartIcon: Icons.remove),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                                cartItems[i]
                                                    .quantity
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                )),
                                            ECCartButton(
                                                onTap: () {
                                                  bloc.incrementCartItem(
                                                      cartItems[i]);
                                                },
                                                cartIcon: Icons.add),
                                            ECCartButton(
                                                onTap: () {
                                                  bloc.removeItemFromCart(
                                                      cartItems[i]);
                                                },
                                                cartIcon: Icons.delete_outline),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                );
              }),
        ]),
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Totals",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$${context.watch<CartCubit>().totalAmount().toString()}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 45,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: EcommerceColors.green),
                  child: const Text(
                    "Continue for payments",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Inter",
                      color: EcommerceColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          )
        ]
        //)
        );
  }
}
