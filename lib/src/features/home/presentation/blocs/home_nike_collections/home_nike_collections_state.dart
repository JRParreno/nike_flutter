part of 'home_nike_collections_bloc.dart';

abstract class HomeNikeCollectionsState extends Equatable {
  const HomeNikeCollectionsState();

  @override
  List<Object> get props => [];
}

class HomeNikeCollectionsInitial extends HomeNikeCollectionsState {}

class HomeNikeCollectionsLoading extends HomeNikeCollectionsState {}

class HomeNikeCollectionsLoaded extends HomeNikeCollectionsState {
  final NikeCollectionModel nikeCollectionModel;

  const HomeNikeCollectionsLoaded(this.nikeCollectionModel);

  @override
  List<Object> get props => [
        nikeCollectionModel,
      ];
}

class HomeNikeCollectionsErrorState extends HomeNikeCollectionsState {
  final String errorMsg;

  const HomeNikeCollectionsErrorState(this.errorMsg);

  @override
  List<Object> get props => [
        errorMsg,
      ];
}
