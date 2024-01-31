part of 'home_nike_collections_bloc.dart';

abstract class HomeNikeCollectionsEvent extends Equatable {
  const HomeNikeCollectionsEvent();

  @override
  List<Object> get props => [];
}

class OnHomeGetNikeCollecctions extends HomeNikeCollectionsEvent {}
