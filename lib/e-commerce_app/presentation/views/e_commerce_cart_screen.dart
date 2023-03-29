import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_cart_button.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cart_item_cubit.dart';
import '../widgets/ec_cart_header.dart';

class ECCartScreen extends StatefulWidget {
  final Product product;

  const ECCartScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ECCartScreen> createState() => _ECCartScreenState();
}

class _ECCartScreenState extends State<ECCartScreen> {
  late CartItemCubit _cartItemCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cartItemCubit = CartItemCubit()..incrementCartItem();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: _cartItemCubit,
        child: Scaffold(
          body: Column(
            children: [
              const ECCartHeader(),
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
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
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Row(
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
                                  image: AssetImage(widget.product.image),
                                  fit: BoxFit.fitHeight)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${widget.product.price}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 9,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    ECCartButton(cartIcon: Icons.remove),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    ECCartButton(cartIcon: Icons.add),
                                    ECCartButton(
                                        cartIcon: Icons.delete_outline),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          persistentFooterButtons: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Totals",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "\$ 1999,99",
                        style: TextStyle(
                          fontSize: 14,
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
          ],
        ));
  }
}
