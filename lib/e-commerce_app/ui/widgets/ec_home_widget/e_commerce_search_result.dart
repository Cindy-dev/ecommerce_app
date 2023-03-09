import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/ui/widgets/ec_home_widget/ec_search_header.dart';

class ECSearchResult extends StatefulWidget {
  const ECSearchResult({Key? key}) : super(key: key);

  @override
  State<ECSearchResult> createState() => _ECSearchResultState();
}

class _ECSearchResultState extends State<ECSearchResult> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Column(
        children: [ECSearchHeader()],
      ),
    );
  }
}
