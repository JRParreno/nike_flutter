import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nike_flutter/gen/colors.gen.dart';
import 'package:nike_flutter/src/core/common/widgets/buttons/custom_button_chip.dart';
import 'package:nike_flutter/src/features/home/domain/entities/nike_category.dart';
import 'package:nike_flutter/src/features/home/presentation/blocs/nike_categories_bloc/nike_categories_bloc.dart';
import 'package:unicons/unicons.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 20,
        right: 10,
        top: 20,
        bottom: 20,
      ),
      child: BlocBuilder<NikeCategoriesBloc, NikeCategoriesState>(
        builder: (context, state) {
          return SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CATEGORIES',
                        style: TextStyle(
                          fontSize: 17,
                          color: ColorName.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(10),
                      BlocBuilder<NikeCategoriesBloc, NikeCategoriesState>(
                        builder: (context, state) {
                          if (state is NikeCategoriesErrorState) {
                            return const Text(
                              'Something went wrong',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            );
                          }

                          if (state is NikeCategoriesLoaded) {
                            return Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ...chipButtons(
                                      state.nikeCategoryModel.nikeCategories),
                                ],
                              ),
                            );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                ),
                if (state is NikeCategoriesLoaded) ...[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: GestureDetector(
                        child: const SizedBox(
                          height: 55,
                          width: 55,
                          child: CircleAvatar(
                            backgroundColor: ColorName.secondary,
                            radius: 35,
                            child: Icon(
                              UniconsLine.sliders_v_alt,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> chipButtons(List<NikeCategory> data) {
    if (data.length > 3) {
      return data
          .take(3)
          .map((e) => CustomButtonChip(
                title: e.name,
                imagePath: e.iconUrl,
              ))
          .toList();
    }

    return [];
  }
}
