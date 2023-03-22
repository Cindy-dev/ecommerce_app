import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'e-commerce_app/presentation/views/e_commerce_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
            create: (_) => ProductBloc(), child: const ECommerceHomeScreen()));
  }
}
