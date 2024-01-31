part of 'home_nike_shoe_bloc.dart';

abstract class HomeNikeShoeState extends Equatable {
  const HomeNikeShoeState();

  @override
  List<Object> get props => [];
}

class HomeNikeShoeInitial extends HomeNikeShoeState {}

class HomeNikeShoeLoading extends HomeNikeShoeState {}

class HomeNikeShoeLoaded extends HomeNikeShoeState {
  final NikeShoeModel nikeShoeModel;

  const HomeNikeShoeLoaded(this.nikeShoeModel);

  @override
  List<Object> get props => [
        nikeShoeModel,
      ];
}

class HomeNikeShoeErrorState extends HomeNikeShoeState {
  final String errorMsg;

  const HomeNikeShoeErrorState(this.errorMsg);

  @override
  List<Object> get props => [
        errorMsg,
      ];
}
