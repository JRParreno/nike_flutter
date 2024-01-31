import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'package:nike_flutter/gen/colors.gen.dart';

class NikeImageCard extends StatelessWidget {
  const NikeImageCard({
    super.key,
    required this.imagePath,
    required this.onTapWishlist,
    required this.onTapCard,
    this.bgHeart,
    this.position,
  });

  final String imagePath;
  final VoidCallback onTapWishlist;
  final VoidCallback onTapCard;
  final Color? bgHeart;
  final double? position;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCard();
      },
      child: Card(
        elevation: 2,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: double.maxFinite,
                width: double.infinity,
              ),
              Positioned(
                right: position ?? 8,
                top: position ?? 8,
                child: IconButton.filled(
                  style: IconButton.styleFrom(
                      backgroundColor: bgHeart ?? Colors.white),
                  enableFeedback: true,
                  color: ColorName.primary,
                  icon: const Icon(
                    UniconsLine.heart,
                  ),
                  onPressed: () {
                    onTapWishlist();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
