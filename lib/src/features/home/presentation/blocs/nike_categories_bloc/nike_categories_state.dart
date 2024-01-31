part of 'nike_categories_bloc.dart';

abstract class NikeCategoriesState extends Equatable {
  const NikeCategoriesState();

  @override
  List<Object> get props => [];
}

class NikeCategoriesInitial extends NikeCategoriesState {}

class NikeCategoriesLoading extends NikeCategoriesState {}

class NikeCategoriesLoaded extends NikeCategoriesState {
  final NikeCategoryModel nikeCategoryModel;

  const NikeCategoriesLoaded({
    required this.nikeCategoryModel,
  });

  @override
  List<Object> get props => [
        nikeCategoryModel,
      ];
}

class NikeCategoriesErrorState extends NikeCategoriesState {
  final String errorMsg;

  const NikeCategoriesErrorState(this.errorMsg);

  @override
  List<Object> get props => [
        errorMsg,
      ];
}
