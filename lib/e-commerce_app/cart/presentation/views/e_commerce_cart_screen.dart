import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/cart/presentation/widgets/ec_cart_widget.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../cubits/cart_cubit.dart';
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
          const ECCartWidget()
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
