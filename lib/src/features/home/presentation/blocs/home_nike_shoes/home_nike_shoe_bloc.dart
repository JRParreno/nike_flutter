import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_flutter/src/features/home/data/models/nike_shoe_model.dart';
import 'package:nike_flutter/src/features/home/domain/repositories/nike_shoe_repository.dart';

part 'home_nike_shoe_event.dart';
part 'home_nike_shoe_state.dart';

class HomeNikeShoeBloc extends Bloc<HomeNikeShoeEvent, HomeNikeShoeState> {
  final NikeShoeRepository _nikeShoeRepository;

  HomeNikeShoeBloc(this._nikeShoeRepository) : super(HomeNikeShoeInitial()) {
    on<OnHomeGetNikeShoes>(onHomeGetNikeCollecctions);
  }

  Future<void> onHomeGetNikeCollecctions(
      OnHomeGetNikeShoes event, Emitter<HomeNikeShoeState> emit) async {
    try {
      emit(HomeNikeShoeLoading());

      await Future.delayed(
          const Duration(
            seconds: 2,
          ), () async {
        final result = await _nikeShoeRepository.getNikeShoes();

        emit(HomeNikeShoeLoaded(result));
      });
    } catch (e) {
      emit(const HomeNikeShoeErrorState('Something went wrong'));
    }
  }
}
