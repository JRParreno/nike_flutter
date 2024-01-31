import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_flutter/gen/colors.gen.dart';
import 'package:unicons/unicons.dart';

PreferredSizeWidget homeAppBar({
  required BuildContext context,
  required VoidCallback onTapSearch,
  required VoidCallback onTapCart,
}) {
  return AppBar(
    toolbarHeight: kToolbarHeight,
    titleSpacing: 0,
    backgroundColor: ColorName.primary,
    centerTitle: true,
    scrolledUnderElevation: 0.5,
    leading: GestureDetector(
      onTap: () {
        onTapSearch();
      },
      child: const Icon(
        CupertinoIcons.search,
        color: ColorName.secondary,
        size: 25,
      ),
    ),
    actions: [
      GestureDetector(
        onTap: () {
          onTapCart();
        },
        child: const Padding(
          padding: EdgeInsets.only(
            right: 13,
          ),
          child: Icon(
            UniconsLine.shopping_cart,
            color: ColorName.secondary,
          ),
        ),
      ),
    ],
    title: const Text(
      "Nike",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        letterSpacing: .3,
        fontFamily: 'Futura',
      ),
    ),
  );
}
