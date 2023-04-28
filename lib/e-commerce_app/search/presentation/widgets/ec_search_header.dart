import 'package:flutter/material.dart';
import '../../../cart/presentation/views/e_commerce_cart_screen.dart';
import '../../../cart/presentation/widgets/ec_cart_banner.dart';
import '../../../util/e_commerce_colors.dart';
import '../../../util/navigators.dart';

class ECSearchHeader extends StatefulWidget {
  final TextEditingController search;
  final void Function(String)? onChanged;
  const ECSearchHeader({Key? key, required this.search, this.onChanged})
      : super(key: key);

  @override
  State<ECSearchHeader> createState() => _ECSearchHeaderState();
}

class _ECSearchHeaderState extends State<ECSearchHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onPressed: () => navigatePop(context),
          icon: const Icon(
            Icons.arrow_back,
            size: 29,
            color: EcommerceColors.black,
          ),
        ),
        const SizedBox(width: 11),
        Flexible(
          flex: 3,
          child: TextFormField(
              controller: widget.search,
              onChanged: widget.onChanged,
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: EcommerceColors.black,
                fontSize: 13,
              ),
              cursorColor: EcommerceColors.gray,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: EcommerceColors.gray),
                      borderRadius: BorderRadius.circular(8)),
                  prefixIcon: Image.asset(
                    "assets/e_commerce_app/e_commerce_image/Search.png",
                    scale: 4,
                  ),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: EcommerceColors.gray),
                      borderRadius: BorderRadius.circular(8)))),
        ),
        const SizedBox(
          width: 11,
        ),
        GestureDetector(
          onTap: () => navigatePushIos(context, const ECCartScreen()),
          child: Stack(
            children: [
              Image.asset(
                "assets/e_commerce_app/e_commerce_image/Buy.png",
                scale: 4,
              ),
              const Positioned(right: 0, child: ECCartBanner()),
            ],
          ),
        ),
      ],
    );
  }
}
