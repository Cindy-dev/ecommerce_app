import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/bootstrap.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/cubits/cart_item_cubit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_ui/e-commerce_app/presentation/blocs/product_bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'e-commerce_app/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'e-commerce_app/presentation/providers/cart_provider.dart';
import 'e-commerce_app/presentation/views/e_commerce_home_screen.dart';

void main() {
  runApp(const MyApp());
 // bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
          BlocProvider(create: (context) => CartItemCubit()),
          BlocProvider(create: (context) => ProductBloc()),
          BlocProvider(create: (context) => CartBloc()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ECommerceHomeScreen(),
        ));
  }
}
