import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nike_flutter/gen/colors.gen.dart';
import 'package:nike_flutter/src/features/home/data/datasources/nike_category_repository_impl.dart';
import 'package:nike_flutter/src/features/home/data/datasources/nike_collection_repository_impl.dart';
import 'package:nike_flutter/src/features/home/data/datasources/nike_shoe_repository_impl.dart';
import 'package:nike_flutter/src/features/home/presentation/blocs/home_nike_collections/home_nike_collections_bloc.dart';
import 'package:nike_flutter/src/features/home/presentation/blocs/home_nike_shoes/home_nike_shoe_bloc.dart';
import 'package:nike_flutter/src/features/home/presentation/blocs/nike_categories_bloc/nike_categories_bloc.dart';
import 'package:nike_flutter/src/features/home/presentation/widgets/home_appbar.dart';
import 'package:nike_flutter/src/features/home/presentation/widgets/home_body.dart';
import 'package:nike_flutter/src/features/home/presentation/widgets/home_bottom_navigation_bar.dart';
import 'package:nike_flutter/src/features/home/presentation/widgets/home_categories.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final NikeCategoriesBloc nikeCategoriesBloc =
      NikeCategoriesBloc(NikeCategoryRepositoryImpl());

  final HomeNikeCollectionsBloc homeNikeCollectionsBloc =
      HomeNikeCollectionsBloc(NikeCollectionRepositoryImpl());

  final HomeNikeShoeBloc homeNikeShoesBloc =
      HomeNikeShoeBloc(NikeShoeRepositoryImpl());

  @override
  void initState() {
    super.initState();
    initBlocs();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => nikeCategoriesBloc,
        ),
        BlocProvider(
          create: (context) => homeNikeCollectionsBloc,
        ),
        BlocProvider(
          create: (context) => homeNikeShoesBloc,
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorName.primary,
        appBar: homeAppBar(
          onTapSearch: () {},
          onTapCart: () {},
          context: context,
        ),
        body: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                HomeCategories(),
                Gap(20),
                HomeBody(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: HomeBottomNavigationBar(
          currentIndex: currentIndex,
          onChangeNav: (value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),
      ),
    );
  }

  void initBlocs() {
    nikeCategoriesBloc.add(OnGetNikeCategories());
    homeNikeCollectionsBloc.add(OnHomeGetNikeCollecctions());
    homeNikeShoesBloc.add(OnHomeGetNikeShoes());
  }
}
