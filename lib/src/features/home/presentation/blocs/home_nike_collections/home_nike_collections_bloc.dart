import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_flutter/src/features/home/data/models/nike_collection_model.dart';
import 'package:nike_flutter/src/features/home/domain/repositories/nike_collection_repository.dart';

part 'home_nike_collections_event.dart';
part 'home_nike_collections_state.dart';

class HomeNikeCollectionsBloc
    extends Bloc<HomeNikeCollectionsEvent, HomeNikeCollectionsState> {
  final NikeCollectionRepository _nikeCollectionRepository;

  HomeNikeCollectionsBloc(this._nikeCollectionRepository)
      : super(HomeNikeCollectionsInitial()) {
    on<OnHomeGetNikeCollecctions>(onHomeGetNikeCollecctions);
  }

  Future<void> onHomeGetNikeCollecctions(OnHomeGetNikeCollecctions event,
      Emitter<HomeNikeCollectionsState> emit) async {
    try {
      emit(HomeNikeCollectionsLoading());

      await Future.delayed(
          const Duration(
            seconds: 2,
          ), () async {
        final result = await _nikeCollectionRepository.getNikeCollections();

        emit(HomeNikeCollectionsLoaded(result));
      });
    } catch (e) {
      emit(const HomeNikeCollectionsErrorState('Something went wrong'));
    }
  }
}
