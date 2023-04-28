import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'e-commerce_app/bootstrap.dart';
import 'e-commerce_app/cart/presentation/cubits/cart_cubit.dart';
import 'e-commerce_app/favorite/presentation/cubits/fave_cubit.dart';
import 'e-commerce_app/product/presentation/blocs/product_bloc.dart';
import 'e-commerce_app/product/presentation/views/e_commerce_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: '${dotenv.env['Project_URL']}',
    anonKey: '${dotenv.env['api_key']}',
  );

  bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductBloc()),
          BlocProvider(create: (context) => FaveCubit()),
          BlocProvider(create: (context) => CartCubit()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ECommerceHomeScreen(),
        ));
  }
}
