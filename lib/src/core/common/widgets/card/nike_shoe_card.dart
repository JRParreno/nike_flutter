import 'package:flutter/material.dart';

import 'package:nike_flutter/src/core/common/widgets/card/nike_image_card.dart';
import 'package:nike_flutter/src/features/home/domain/entities/nike_shoe.dart';

class NikeShoeCard extends StatelessWidget {
  const NikeShoeCard({
    super.key,
    required this.nikeShoe,
    required this.onTapWishlist,
    required this.onTapCard,
  });

  final NikeShoe nikeShoe;
  final VoidCallback onTapWishlist;
  final VoidCallback onTapCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: NikeImageCard(
              imagePath: nikeShoe.imageUrl,
              onTapWishlist: onTapWishlist,
              onTapCard: onTapCard,
              bgHeart: Colors.transparent,
              position: 1,
            ),
          ),
          Text(
            nikeShoe.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Text(
            '\$140.99',
            style: TextStyle(
                fontSize: 11,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
