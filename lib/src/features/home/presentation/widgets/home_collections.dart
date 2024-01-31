import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nike_flutter/gen/colors.gen.dart';
import 'package:nike_flutter/src/core/common/widgets/card/nike_image_card.dart';
import 'package:nike_flutter/src/features/home/presentation/blocs/home_nike_collections/home_nike_collections_bloc.dart';

class HomeCollections extends StatelessWidget {
  const HomeCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        const Text(
          'COLLECTIONS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        const Gap(15),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.43,
          width: double.infinity,
          child: BlocBuilder<HomeNikeCollectionsBloc, HomeNikeCollectionsState>(
            builder: (context, state) {
              if (state is HomeNikeCollectionsErrorState) {
                return Center(
                  child: Text(state.errorMsg),
                );
              }

              if (state is HomeNikeCollectionsLoaded) {
                return CarouselSlider(
                  items: state.nikeCollectionModel.nikeCollections
                      .map(
                        (e) => NikeImageCard(
                          imagePath: e.imageUrl,
                          onTapCard: handleOnTapCard,
                          onTapWishlist: handleOnTapWishlist,
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.5,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {}),
                );
              }

              return const Center(
                child: CircularProgressIndicator(
                  color: ColorName.primary,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void handleOnTapCard() {
    print('tap card');
  }

  void handleOnTapWishlist() {
    print('tap wish list');
  }
}
