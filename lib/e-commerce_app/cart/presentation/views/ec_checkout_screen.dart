import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/cart/presentation/views/ec_receipt_screen.dart';
import 'package:flutter_app_ui/e-commerce_app/cart/presentation/widgets/checkout_textfield.dart';
import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import 'package:flutter_app_ui/e-commerce_app/util/navigators.dart';
import '../widgets/ec_checkout_summary.dart';

class ECCheckoutScreen extends StatefulWidget {
  final Product prod;
  const ECCheckoutScreen({Key? key, required this.prod}) : super(key: key);

  @override
  State<ECCheckoutScreen> createState() => _ECCheckoutScreenState();
}

class _ECCheckoutScreenState extends State<ECCheckoutScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () => navigatePop(context),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios),
                  )),
              const ECCheckoutSummary(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15),
                        CheckoutTextField(
                          label: "Email or mobile phone number",
                          controller: _emailController,
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          "Shipping Address",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 15),
                        CheckoutTextField(
                          label: "First name (optional)",
                          controller: _firstnameController,
                        ),
                        const SizedBox(height: 15),
                        CheckoutTextField(
                          label: "Last name",
                          controller: _lastnameController,
                        ),
                        const SizedBox(height: 15),
                        CheckoutTextField(
                          label: "Address",
                          controller: _addressController,
                        ),
                        const SizedBox(height: 15),
                        CheckoutTextField(
                          label: "City",
                          controller: _cityController,
                        ),
                        const SizedBox(height: 15),
                        CheckoutTextField(
                          label: "Phone",
                          controller: _phoneController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        persistentFooterButtons: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () => navigatePush(context, const ECReceiptScreen()),
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: EcommerceColors.green),
                  child: const Text(
                    "Continue to Payments",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Inter",
                      color: EcommerceColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ))
        ]);
  }
}
