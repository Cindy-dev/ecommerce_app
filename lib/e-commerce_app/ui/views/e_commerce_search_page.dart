import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/widgets/ec_home_widget/e_commerce_search_result.dart';

class ECSearchPage extends StatelessWidget {
  const ECSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ECSearchResult(),
    );
  }
}
