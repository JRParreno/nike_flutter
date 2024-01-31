import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_flutter/src/features/home/data/models/nike_category_model.dart';
import 'package:nike_flutter/src/features/home/domain/repositories/nike_category_repository.dart';

part 'nike_categories_event.dart';
part 'nike_categories_state.dart';

class NikeCategoriesBloc
    extends Bloc<NikeCategoriesEvent, NikeCategoriesState> {
  final NikeCategoryRepository _nikeCategoryRepository;

  NikeCategoriesBloc(this._nikeCategoryRepository)
      : super(NikeCategoriesInitial()) {
    on<OnGetNikeCategories>(onGetNikeCategories);
  }

  Future<void> onGetNikeCategories(
      OnGetNikeCategories event, Emitter<NikeCategoriesState> emit) async {
    try {
      emit(NikeCategoriesLoading());

      await Future.delayed(
          const Duration(
            seconds: 2,
          ), () async {
        final result = await _nikeCategoryRepository.getNikeCategory();

        emit(NikeCategoriesLoaded(nikeCategoryModel: result));
      });
    } catch (e) {
      emit(NikeCategoriesErrorState(e.toString()));
    }
  }
}
