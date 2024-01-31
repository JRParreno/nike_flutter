part of 'nike_categories_bloc.dart';

abstract class NikeCategoriesEvent extends Equatable {
  const NikeCategoriesEvent();

  @override
  List<Object> get props => [];
}

class OnGetNikeCategories extends NikeCategoriesEvent {}
