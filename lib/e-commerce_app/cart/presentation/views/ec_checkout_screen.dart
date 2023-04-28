import 'package:flutter/material.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import '../../../data/models/product.dart';
import '../../../util/e_commerce_colors.dart';
import '../../../util/navigators.dart';
import '../widgets/checkout_textfield.dart';
import 'ec_receipt_screen.dart';

class ECCheckoutScreen extends StatefulWidget {
  final Product prod;
  const ECCheckoutScreen({Key? key, required this.prod}) : super(key: key);

  @override
  State<ECCheckoutScreen> createState() => _ECCheckoutScreenState();
}

class _ECCheckoutScreenState extends State<ECCheckoutScreen> {
  String stateValue = NigerianStatesAndLGA.allStates[0];
  String lgaValue = 'Select your LGA';
  List<String> statesLga = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "DELIVERY DETAILS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "State",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: EcommerceColors.gray)),
                        child: DropdownButton<String>(
                            underline: Container(),
                            key: const ValueKey('States'),
                            value: stateValue,
                            isExpanded: true,
                            hint: const Text('Select a Nigerian state'),
                            items: NigerianStatesAndLGA.allStates
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Inter",
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (val) {
                              lgaValue = 'Select a Local Government Area';
                              statesLga.clear();
                              statesLga.add(lgaValue);
                              statesLga.addAll(
                                  NigerianStatesAndLGA.getStateLGAs(val!));
                              setState(() {
                                stateValue = val;
                              });
                            }),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "L.G.A",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: EcommerceColors.gray)),
                        child: DropdownButton<String>(
                            underline: Container(),
                            key: const ValueKey('Local governments'),
                            value: lgaValue,
                            isExpanded: true,
                            hint: const Text('Select a Lga'),
                            items: statesLga
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                lgaValue = val!;
                              });
                            }),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Street Address",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CheckoutTextField(
                        label: "Street Address",
                        controller: _addressController,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CheckoutTextField(
                        label: "Name",
                        controller: _nameController,
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Phone Number",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CheckoutTextField(
                        label: "Phone Number",
                        controller: _phoneController,
                      ),
                    ],
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
                onTap: () => navigatePush(
                    context,
                    ECReceiptScreen(
                      lga: lgaValue,
                      name: _nameController.text,
                      address: _addressController.text,
                      phone: _phoneController.text,
                      state: stateValue,
                    )),
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
