import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/search/presentation/widgets/e_commerce_search_result.dart';
import '../../../data/models/product.dart';
import '../../../util/dummy_data.dart';
import '../../../util/e_commerce_colors.dart';
import '../widgets/ec_search_header.dart';

class ECSearchPage extends StatefulWidget {
  const ECSearchPage({Key? key}) : super(key: key);

  @override
  State<ECSearchPage> createState() => _ECSearchPageState();
}

class _ECSearchPageState extends State<ECSearchPage> {
  String? searchWord = "";
  final TextEditingController _search = TextEditingController();
  List<Product> productList = DummyData.productList;
  List<Product> foundProduct = [];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: height / 16, left: 0, right: 20),
      child: Column(children: [
        ECSearchHeader(
          search: _search,
          onChanged: (value) {
            //creating a method to rebuild the ui once the typed name is found
            foundProduct = productList
                .where((product) =>
                    product.name.toLowerCase().contains(value.toLowerCase()))
                .toList();
            searchWord = value;
            setState(() {});
          },
        ),
        const SizedBox(height: 14),
        const Divider(
          color: EcommerceColors.gray,
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: searchWord == ""
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Search result for '$searchWord'",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: EcommerceColors.black,
                            fontSize: 14),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Filters",
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              color: EcommerceColors.black,
                              fontSize: 12),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                            "assets/e_commerce_app/e_commerce_image/Filter.png",
                            scale: 4),
                      ],
                    ),
                  ],
                ),
        ),
        MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: Expanded(
            //if the text typed is found in the list of products then we can display it in a listview
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: foundProduct.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      itemCount: foundProduct.length,
                      itemBuilder: (context, i) {
                        final product = foundProduct[i];
                        return ECSearchResult(
                          searchWord: product.name,
                          prod: product,
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 3,
                      ))
                  //if not found we throw a text to show it doesn't exist
                  : Center(
                      child:
                          //Text('No transaction data found')))
                          Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Last search",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                color: EcommerceColors.black,
                                fontSize: 16),
                          ),
                          Text(
                            "Clear all",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                color: EcommerceColors.red,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.access_time,
                                  color: EcommerceColors.gray,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "Iphone 12 pro max",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w400,
                                      color: EcommerceColors.black,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.close,
                                  color: EcommerceColors.gray,
                                ))
                          ],
                        ),
                      ),
                    ])),
            ),
          ),
        ),
      ]),
    ));
  }
}
