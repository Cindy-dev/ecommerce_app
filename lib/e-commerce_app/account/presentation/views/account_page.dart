import 'package:flutter/material.dart';
import '../../../util/dummy_data.dart';
import '../../../util/e_commerce_colors.dart';
import '../../../util/navigators.dart';
import '../widgets/text_form.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final storeNameController = TextEditingController();
  final imageController = TextEditingController();
  final storeImageController = TextEditingController();
  final priceController = TextEditingController();
  final colorsController = TextEditingController();
  late List<bool> isChecked;
  List<String> selectedColors = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isChecked = List<bool>.filled(DummyData.productColors.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EcommerceColors.green,
        title: const Text(
          'Create Product',
          style: TextStyle(
              fontFamily: "Inter", color: EcommerceColors.white, fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              children: [
                ECTextField(
                    controller: nameController,
                    hintText: "Product Name",
                    fontSize: 16),
                ECTextField(
                    controller: descController,
                    hintText: "Product Description",
                    fontSize: 16),
                ECTextField(
                    controller: priceController,
                    hintText: "Product Price",
                    fontSize: 16),
                ECTextField(
                    controller: imageController,
                    hintText: "Product Image",
                    fontSize: 16),
                ECTextField(
                    controller: storeNameController,
                    hintText: "Store Name",
                    fontSize: 16),
                ECTextField(
                    controller: storeImageController,
                    hintText: "Store Image",
                    fontSize: 16),
                ECTextField(
                    controller: colorsController,
                    hintText: "Product Colors",
                    fontSize: 16),
                const Text(
                  "Scroll to select product colors",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: DummyData.productColors.length,
                      itemBuilder: (context, i) {
                        final colors = DummyData.productColors[i];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Checkbox(
                                  activeColor: EcommerceColors.green,
                                  value: isChecked[i],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked[i] = value!;
                                    });

                                    /// this logic adds or remove new product colors in a list based on user interaction with the checkbox
                                    if (isChecked[i] == true) {
                                      selectedColors.add(colors);
                                    } else {
                                      selectedColors.remove(colors);
                                    }
                                  }),
                              const SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: Color(int.parse(colors)),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
              color: EcommerceColors.green,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: EcommerceColors.green)),
          child: const Text(
            'Save Product',
            style: TextStyle(
                fontFamily: "Inter",
                color: EcommerceColors.white,
                fontSize: 17),
          ),
        ),
      ],
    );
  }
}

class AdminAuth extends StatefulWidget {
  const AdminAuth({Key? key}) : super(key: key);

  @override
  State<AdminAuth> createState() => _AdminAuthState();
}

class _AdminAuthState extends State<AdminAuth> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ECTextField(
                    controller: nameController,
                    hintText: "Admin Name",
                    fontSize: 16,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field cant be empty";
                      }
                      return null;
                    },
                  ),
                  ECTextField(
                    controller: passwordController,
                    hintText: "Admin Password",
                    fontSize: 16,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field cant be empty";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        } else {
                          if (nameController.text == "admin" &&
                              passwordController.text == "admin123") {
                            navigatePush(context, const AccountPage());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: EcommerceColors.red,
                                duration: Duration(seconds: 2),
                                content: Text(
                                  "Invalid Login Details",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('Login')),
                ],
              ),
            ),
          ),
        ));
  }
}
