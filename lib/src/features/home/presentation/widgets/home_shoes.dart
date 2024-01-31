import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_flutter/gen/colors.gen.dart';
import 'package:nike_flutter/src/core/common/widgets/card/nike_shoe_card.dart';
import 'package:nike_flutter/src/features/home/presentation/blocs/home_nike_shoes/home_nike_shoe_bloc.dart';

class HomeShoes extends StatelessWidget {
  const HomeShoes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNikeShoeBloc, HomeNikeShoeState>(
      builder: (context, state) {
        if (state is HomeNikeShoeErrorState) {
          return Center(
            child: Text(state.errorMsg),
          );
        }
        if (state is HomeNikeShoeLoaded) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Wrap(
                spacing: 5,
                runSpacing: 20,
                alignment: WrapAlignment.start,
                children: state.nikeShoeModel.nikeShoes
                    .map(
                      (e) => NikeShoeCard(
                        nikeShoe: e,
                        onTapCard: handleOnTapCard,
                        onTapWishlist: handleOnTapWishlist,
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: ColorName.primary,
          ),
        );
      },
    );
  }

  void handleOnTapCard() {
    print('tap card');
  }

  void handleOnTapWishlist() {
    print('tap wish list');
  }
}
