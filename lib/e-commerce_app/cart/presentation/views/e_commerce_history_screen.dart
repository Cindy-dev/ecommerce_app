import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/cart/presentation/widgets/history_row.dart';
import 'package:flutter_app_ui/e-commerce_app/util/dummy_data.dart';
import '../../../util/e_commerce_colors.dart';

class ECHistoryScreen extends StatelessWidget {
  const ECHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: EcommerceColors.green,
          title: const Text(
            "Order History",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: EcommerceColors.white,
                fontFamily: "Inter"),
          ),
        ),
        body: DummyData.orderHistory.isEmpty
            ? const Center(
                child: Text(
                  "No order yet",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      fontFamily: "Inter"),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: DummyData.orderHistory.length,
                itemBuilder: (context, i) {
                  final order = DummyData.orderHistory[i];
                  return Card(
                    color: EcommerceColors.green,
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: "Inter"),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                "Color:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    fontFamily: "Inter"),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: order.selectedColor == ""
                                    ? Color(int.parse(order.color![0]))
                                    : Color(int.parse(order.selectedColor)),
                              )
                            ],
                          ),
                          HistoryRow(tag:"Address:", content:  DummyData.address!),
                          const SizedBox(
                            height: 5,
                          ),
                          HistoryRow(tag:"Name: ", content:  DummyData.name!),
                        ],
                      ),
                    ),
                  );
                }));
  }
}
