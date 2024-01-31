import 'package:flutter/material.dart';
import 'package:nike_flutter/gen/colors.gen.dart';
import 'package:nike_flutter/src/features/home/presentation/widgets/home_collections.dart';
import 'package:nike_flutter/src/features/home/presentation/widgets/home_shoes.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: ColorName.secondary,
      ),
      child: const Column(
        children: [
          HomeCollections(),
          HomeShoes(),
        ],
      ),
    );
  }
}
