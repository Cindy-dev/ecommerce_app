import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/widgets/ec_home_widget/ec_cart_header.dart';

class ECCartScreen extends StatefulWidget {
  const ECCartScreen({Key? key}) : super(key: key);

  @override
  State<ECCartScreen> createState() => _ECCartScreenState();
}

class _ECCartScreenState extends State<ECCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ECCartHeader(),
        Divider(),
        Row(),
        Divider(),
      ],),
    );
  }
}
