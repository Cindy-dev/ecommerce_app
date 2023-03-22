import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_app_ui/e-commerce_app/util/navigators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../util/e_commerce_colors.dart';
import '../views/e_commerce_detail_screen.dart';

class ECItemCard extends StatefulWidget {
  const ECItemCard({Key? key}) : super(key: key);

  @override
  State<ECItemCard> createState() => _ECItemCardState();
}

class _ECItemCardState extends State<ECItemCard> {
  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    final double itemHeight = (deviceH - kToolbarHeight - 100) / 2.8;
    final double itemWidth = deviceW / 2.15;
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Builder(
          builder: (context) {
            if (state is ProductStateLoading) {
              return Container(
                padding: EdgeInsets.only(top: deviceH / 7.9),
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: EcommerceColors.green,
                ),
              );
            } else if (state is ProductStateLoaded) {
              return MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 50 / 2,
                          crossAxisSpacing: deviceH / 132,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.4),
                        ),
                        itemCount: state.products.length,
                        itemBuilder: (context, i) {
                          final prod = state.products[i];
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: EcommerceColors.gray)),
                            child: Column(
                              children: [
                                Container(
                                    height: deviceH / 7,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                          image: AssetImage(prod.image)),
                                    )),
                                Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 13,
                                          vertical: deviceH / 91),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            prod.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w400,
                                                color: EcommerceColors.black,
                                                fontSize: 15),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            "\$${prod.price}",
                                            style: const TextStyle(
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w600,
                                                color: EcommerceColors.black,
                                                fontSize: 14),
                                          ),
                                          SizedBox(height: deviceH / 170),
                                          const Spacer(),
                                          FittedBox(
                                            fit: BoxFit.cover,
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: deviceW / 2,
                                              height: deviceH / 15,
                                              decoration: BoxDecoration(
                                                  color: EcommerceColors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: EcommerceColors
                                                          .gray)),
                                              child: const Text(
                                                "Add to cart",
                                                style: TextStyle(
                                                    fontFamily: "Inter",
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xffFFFFFF),
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              );
            } else if (state is ProductStateError) {
              final errorMessage = state.errorMessage;
              return Center(
                child: Text(
                  errorMessage,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              );
            }
            return const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  "Unable to fetch products",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
