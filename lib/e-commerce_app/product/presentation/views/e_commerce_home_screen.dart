import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/account_page.dart';
import 'package:flutter_app_ui/e-commerce_app/cart/presentation/views/e_commerce_cart_screen.dart';
import 'package:flutter_app_ui/e-commerce_app/cart/presentation/views/e_commerce_history_screen.dart';
import 'package:flutter_app_ui/e-commerce_app/favorite_page.dart';
import 'package:flutter_app_ui/e-commerce_app/product/presentation/blocs/product_bloc.dart';
import 'package:flutter_app_ui/e-commerce_app/product/presentation/widgets/ec_homescreen_widget.dart';
import 'package:flutter_app_ui/e-commerce_app/util/e_commerce_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/dummy_data.dart';

class ECommerceHomeScreen extends StatefulWidget {
  const ECommerceHomeScreen({Key? key}) : super(key: key);

  @override
  State<ECommerceHomeScreen> createState() => _ECommerceHomeScreenState();
}

class _ECommerceHomeScreenState extends State<ECommerceHomeScreen> {
  @override
  void initState() {
    //gives access to the bloc
    context.read<ProductBloc>().add(FetchProductEvent());
    super.initState();
  }

  int _selectedIndex = 0;
  static final List<Widget> _screenOptions = <Widget>[
    const ECommerceHomeScreenWidget(),
    const FavoritePage(),
    const ECHistoryScreen(),
    const AccountPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: deviceH / 11,
        width: double.infinity,
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: EcommerceColors.black,
              fontSize: 10),
          unselectedLabelStyle: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: EcommerceColors.black,
              fontSize: 10),
          selectedItemColor: EcommerceColors.green,
          unselectedItemColor: EcommerceColors.grayText,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: "Wishlist"),
            BottomNavigationBarItem(
                icon: Icon(Icons.text_snippet_outlined), label: "History"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_3_outlined), label: "Account"),
          ],
        ),
      ),
    );
  }
}
