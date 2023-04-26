import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/cart/presentation/widgets/ec_cart_add_button.dart';
import 'package:flutter_app_ui/e-commerce_app/favorite/presentation/cubits/fave_cubit.dart';
import 'package:flutter_app_ui/e-commerce_app/product/presentation/views/e_commerce_detail_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../util/e_commerce_colors.dart';
import '../../../util/navigators.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: const Text(
                "MY WISH LIST",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            BlocBuilder<FaveCubit, FaveState>(
              builder: (BuildContext context, FaveState state) {
                if (state is FaveLoading) {
                  return const CircularProgressIndicator();
                } else if (state is FaveAdded || state is FaveRemoved) {
                  final fave = context.read<FaveCubit>().faveItems;
                  if (fave.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 2.5),
                      child: const Center(
                          child: Text("Your wishlist is empty",
                              style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                  color: EcommerceColors.black,
                                  fontSize: 20))),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: fave.length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: EcommerceColors.green),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  GestureDetector(
                                      onTap: () => navigatePush(context,
                                          ECDetailScreen(product: fave[i])),
                                      child: Hero(
                                          tag: fave[i].image,
                                          child: Image.asset(fave[i].image))),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(fave[i].name,
                                              style: const TextStyle(
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w400,
                                                  color: EcommerceColors.black,
                                                  fontSize: 15)),
                                        ),
                                        TextButton(
                                          onPressed: () => context
                                              .read<FaveCubit>()
                                              .toggleFavoriteItem(fave[i]),
                                          child: const Text("Remove Product",
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  fontWeight: FontWeight.w600,
                                                  color: EcommerceColors.red,
                                                  fontSize: 15)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ECCartAddButton(
                                        width: double.infinity,
                                        height: 50,
                                        fontSize: 12,
                                        product: fave[i],
                                        color: ''),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  }
                } else {
                  return const Center(
                    child: Text(
                      "Wishlist is empty",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
