import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../util/e_commerce_cart_button.dart';
import '../../util/e_commerce_colors.dart';
import '../cubits/cart_cubit/cart_cubit.dart';

class ECCartWidget extends StatefulWidget {
  const ECCartWidget({Key? key}) : super(key: key);

  @override
  State<ECCartWidget> createState() => _ECCartWidgetState();
}

class _ECCartWidgetState extends State<ECCartWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
        listener: (_, state) {},
        builder: (context, state) {
          final bloc = context.read<CartCubit>();
          final cartItems = bloc.cartItems;
          if (cartItems.isEmpty) {
            return const Expanded(
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
                    final cart = cartItems[i];
                    final List<dynamic>? items = cart.color;
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
                                    image: AssetImage(cart.image),
                                    fit: BoxFit.fitHeight)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cart.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Variant:",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Inter",
                                      color: EcommerceColors.gray,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  PopupMenuButton(
                                    itemBuilder: (context) {
                                      return items!.map((e) {
                                        return PopupMenuItem(
                                            value: e,
                                            child: CircleAvatar(
                                                radius: 10,
                                                backgroundColor:
                                                    Color(int.parse(e))));
                                      }).toList();
                                    },
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: cart.selectedColor == ""
                                          ? Color(int.parse(cart.color![0]))
                                          : Color(
                                              int.parse(cart.selectedColor)),
                                    ),
                                    onSelected: (e) {
                                      setState(() {
                                        cart.selectedColor = e.toString();
                                      });
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${cart.price}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 9,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ECCartButton(
                                          onTap: () {
                                            bloc.decrementCartItem(cart);
                                          },
                                          cartIcon: Icons.remove),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(cart.quantity.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          )),
                                      ECCartButton(
                                          onTap: () {
                                            bloc.incrementCartItem(cart);
                                          },
                                          cartIcon: Icons.add),
                                      ECCartButton(
                                          onTap: () {
                                            bloc.removeItemFromCart(cart);
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
        });
  }
}
