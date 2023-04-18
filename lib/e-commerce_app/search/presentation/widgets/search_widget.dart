import 'package:flutter/material.dart';

import '../../../data/models/product.dart';
import '../../../util/dummy_data.dart';

void showSearchBar(BuildContext context, TextEditingController search,
    List<Product> foundProduct) {
  List<Product> productList =  DummyData.productList;
  showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black54,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                        controller: search,

                        onChanged: (value) {
                          //creating a method to rebuild the ui once the typed name is found
                          foundProduct = productList
                              .where((transaction) => transaction.name
                                  .toLowerCase()
                                  .contains(value))
                              .toList();
                        })),
                Expanded(
                    //if the text typed is found in the list of transactions then we can display it in a listview
                    child: foundProduct.isNotEmpty
                        ? ListView.builder(
                            itemCount: foundProduct.length,
                            itemBuilder: (context, i) {
                              final transaction = foundProduct[i];
                              //alt + enter for quick assist
                              return Card(
                                child: ListTile(
                                  title: Text(transaction.name),
                                  onTap: () {
                                    transaction;
                                    Navigator.pushNamed(context, '/display',
                                        arguments: transaction.name);
                                  },
                                ),
                              );
                            })
                        //if not found we throw a text to show it doesnt exist
                        : const Center(
                            child: Text('No transaction data found')))
              ],
            ),
          ));
}
