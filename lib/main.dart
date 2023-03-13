import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/views/e_commerce_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
        home:
        ECDetailScreen()
        );
  }
}

