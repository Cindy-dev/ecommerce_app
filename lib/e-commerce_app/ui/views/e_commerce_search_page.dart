import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/widgets/ec_home_widget/e_commerce_search_result.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/widgets/ec_home_widget/ec_search_header.dart';

import '../../util/e_commerce_colors.dart';

class ECSearchPage extends StatelessWidget {
  const ECSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: height / 16, left: 20, right: 20),
      child: Column(
        children: [
          ECSearchHeader(),
          const SizedBox(height: 14),
          const Divider(
            color: EcommerceColors.gray,
          ),
          const SizedBox(height: 18),
        ],
      ),
    ));
  }
}
