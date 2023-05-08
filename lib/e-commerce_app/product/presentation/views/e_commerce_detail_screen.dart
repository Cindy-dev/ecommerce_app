import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product.dart';
import '../../../util/e_commerce_button.dart';
import '../../../util/e_commerce_colors.dart';
import '../../../cart/presentation/cubits/cart_cubit.dart';
import '../../../cart/presentation/widgets/ec_cart_add_button.dart';
import '../widgets/ec_detail_widget.dart';

class ECDetailScreen extends StatefulWidget {
  final Product product;
  const ECDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ECDetailScreen> createState() => _ECDetailScreenState();
}

class _ECDetailScreenState extends State<ECDetailScreen> {
  String selectedColor = "";
  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ECDetailWidget(product: widget.product),
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
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: deviceH / 12,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.product.color?.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedColor =
                                            widget.product.color![index];
                                      });
                                    },
                                    child: selectedColor ==
                                            widget.product.color![index]
                                        ? Stack(
                                            fit: StackFit.passthrough,
                                            children: [
                                              Container(
                                                height: 41,
                                                width: deviceW / 4,
                                                margin: const EdgeInsets.only(
                                                    top: 9,
                                                    bottom: 10,
                                                    right: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Color(int.parse(
                                                        widget.product
                                                            .color![index]))),
                                              ),
                                              const Positioned(
                                                  top: 20,
                                                  left: 20,
                                                  right: 20,
                                                  bottom: 20,
                                                  child: Icon(Icons.check))
                                            ],
                                          )
                                        : Container(
                                            height: 41,
                                            width: deviceW / 4,
                                            margin: const EdgeInsets.only(
                                                top: 9, bottom: 10, right: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Color(int.parse(widget
                                                    .product.color![index]))),
                                          ),
                                  );
                                }),
                          ),
                          ECDetailWidget2(product: widget.product),
                        ],
                      ),
                    ),
                  ),
                ),
              ]);
        },
      ),
      persistentFooterButtons: [
        Padding(
          padding:
              const EdgeInsets.only(top: 14, bottom: 15, left: 21, right: 21),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ECCartAddButton(
                color: selectedColor,
                height: 45,
                width: deviceH / 5.4,
                fontSize: 12,
                product: widget.product,
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
