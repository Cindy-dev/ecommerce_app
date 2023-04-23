import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/account/presentation/widgets/text_form.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_button.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import 'package:flutter_app_ui/e-commerce_app/util/navigators.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final imageController = TextEditingController();
  final storeImageController = TextEditingController();
  final priceController = TextEditingController();
  final colorsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EcommerceColors.green,
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
                    controller: descController,
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

                const ECButton(
                  buttonColor: EcommerceColors.green,
                  buttonText: 'Save Product',
                  textColor: EcommerceColors.white,
                  borderColor: EcommerceColors.green,
                ),
              ],
            ),
          ),
        ),
      ),
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
                  const ECButton(
                    buttonColor: EcommerceColors.green,
                    buttonText: 'Save Product',
                    textColor: EcommerceColors.white,
                    borderColor: EcommerceColors.green,
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
                      child: const Text('Login'))
                ],
              ),
            ),
          ),
        ));
  }
}
