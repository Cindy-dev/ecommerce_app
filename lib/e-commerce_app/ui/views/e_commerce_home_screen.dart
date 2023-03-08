import 'package:flutter/material.dart';
import '../../ui/widgets/ecommerce_home_screen_header.dart';

class ECommerceHomeScreen extends StatelessWidget {
  const ECommerceHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
        children: const [
          EcommerceHomeScreenHeader()
        ],
        ),
      ),
    );
  }
}
